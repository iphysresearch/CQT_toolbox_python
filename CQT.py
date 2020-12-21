import warnings

import numpy as np
from decimal import Decimal, ROUND_HALF_UP

from scipy.signal import butter, blackman, blackmanharris, upfirdn, filtfilt
from scipy import sparse
from scipy.interpolate import interp1d

import matplotlib.pyplot as plt



def upsample(s, n, phase=0):
    """Increase sampling rate by integer factor n  with included offset phase.
    """
    return np.roll(np.kron(s, np.r_[1, np.zeros(n-1)]), phase)


def buffer(x, n, p=0, opt=None):
    '''
    Buffer function like MATLAB. (https://www.mathworks.com/help/signal/ref/buffer.html?searchHighlight=buffer&s_tid=srchtitle)
    
    Ref: https://stackoverflow.com/a/60020929 (Your can check more buffer algorithms from this)
    About buffer function in Python, see also: https://github.com/aaravindravi/python-signal-segmentation/blob/master/buffer.py
    '''
    if opt not in ('nodelay', None):
        raise ValueError('{} not implemented'.format(opt))

    i = 0
    if opt == 'nodelay':
        # No zeros at array start
        result = x[:n]
        i = n
    else:
        # Start with `p` zeros
        result = np.hstack([np.zeros(p), x[:n-p]])
        i = n-p
    # Make 2D array, cast to list for .append()
    result = list(np.expand_dims(result, axis=0))

    while i < len(x):
        # Create next column, add `p` results from last col if given
        col = x[i:i+(n-p)]
        if p != 0:
            col = np.hstack([result[-1][-p:], col])

        # Append zeros if last row and not length `n`
        if len(col):
            col = np.hstack([col, np.zeros(n - len(col))])

        # Combine result with next row
        result.append(np.array(col))
        i += (n - p)

    return np.vstack(result).T

def cqt(x, fmin, fmax, bins, fs, **kwargs):
    '''
    %Xcqt = cqt(x,fmin,fmax,bins,fs,varargin) calculates the constant-Q transform of the input signal x.
    %
    %INPUT:
    %   fmin      ... lowest frequency of interest
    %   fmax      ... highest frequency of interest
    %   bins      ... frequency bins per octave
    %   fs        ... sampling rate
    %
    %   optional input parameters (parameter name/value pairs):
    %
    %   'atomHopFactor'   ... overlap of temporal atoms in percent. Default: 0.25.
    %    
    %   'q'       ... the maximum value for optimal reconstruction is q=1.
    %                 For values smaller than 1 the bandwidths of the spectral
    %                 atoms (filter) are increased retaining their center
    %                 frequencies (frequency 'smearing', frequency domain redundancy 
    %                 increases, time resolutin improves). Default: 1.
    %   'thresh'  ... all values in the cqt kernel smaller than tresh are
    %                 rounded to zero. A high value for thresh yields a
    %                 very sparse kernel (fast) but introduces a bigger error. 
    %                 The default value is chosen so that the error due to rounding is negligible.
    %   'kernel'  ... if the cqt kernel structure has been precomputed
    %                 (using function 'genCQTkernel'), the computation of the kernel
    %                 will be by-passed below).
    %   'win'     ... defines which window will be used for the CQT. Valid
    %                 values are: 'blackman','hann' and 'blackmanharris'. To
    %                 use the square root of each window use the prefix 'sqrt_'
    %                 (i.e. 'sqrt_blackman'). Default: 'sqrt_blackmanharris'
    %   'coeffB',
    %   'coeffA'  ... Filter coefficients for the anti-aliasing filter, where
    %                 'coeffB' is the numerator and 'coeffA' is the
    %                 denominator (listed in descending powers of z). 
    %                                                  
    %OUTPUT:
    %   Xcqt      ... struct that comprises various fields: 
    %              spCQT: CQT coefficients in the form of a sparse matrix 
    %                    (rasterized, not interpolated)
    %              fKernel: spectral Kernel 
    %              fmin: frequency of the lowest bin
    %              fmax: frequency of the hiqhest bin
    %              octaveNr: number of octaves processed
    %              bins: number of bins per octave
    %              intParams: structure containing additional parameters for the inverse transform   
    %He Wang, 2020/12/01 hewang@mail.bnu.edu.cn    
    %'''
    
    # input checking
    if (len(x.shape) > 1) and (x.shape[0] > 1):
        warnings.warn('qt requires one-dimensional input!', UserWarning)
    if (len(x.shape) > 1):
        x = x.reshape(-1) # column vector
        
    # input parameters
    q             = kwargs.get('q', 1)
    atomHopFactor = kwargs.get('atomHopFactor', 0.25)
    thresh        = kwargs.get('thresh', 0.0005)
    cqtKernel     = kwargs.get('kernel')
    winFlag       = kwargs.get('win', 'sqrt_blackmanharris')
    B             = kwargs.get('coeffB')
    A             = kwargs.get('coeffA')
    
    # define
    octaveNr = int(np.ceil(np.log2(fmax/fmin)))
    fmin = (fmax/2**octaveNr) * 2**(1/bins) # set fmin to actual value
    xlen_init = x.size
    
    
    # design lowpass filter
    if (not B) or (not A):
        LPorder = 6 # order of the anti-aliasing filter
        cutoff = 0.5
        B, A = butter(LPorder, cutoff, 'low') # design f_nyquist/2-lowpass filter

    # design kernel for one octave 
    if not cqtKernel:
        cqtKernel = genCQTkernel(fmax, bins, fs, q=q, atomHopFactor=atomHopFactor, thresh=thresh, win=winFlag)

    # calculate CQT
    cellCQT = {} #np.zeros(octaveNr)
    maxBlock = cqtKernel['fftLEN'] * 2**(octaveNr-1) # largest FFT Block (virtual)
    suffixZeros = maxBlock
    prefixZeros = maxBlock
    x = np.pad(x, (suffixZeros, prefixZeros), 'constant', constant_values=(0, 0))
    OVRLP = int(cqtKernel['fftLEN'] - cqtKernel['fftHOP'])
    K = cqtKernel['fKernel'].conj().T # %conjugate spectral kernel for cqt transformation

    for i in range(1, octaveNr+1):

        xx = buffer(x, cqtKernel['fftLEN'], OVRLP, 'nodelay') # generating FFT blocks
        XX = np.fft.fft(xx.T).T # applying fft to each column (each FFT frame)
        cellCQT[i] = np.dot(K, XX) # calculating cqt coefficients for all FFT frames for this octave

        if i != octaveNr:
            x = filtfilt(B, A, x) # anti aliasing filter
            x = x[::2] # drop samplerate by 2
    
    spCQT = cell2sparse(cellCQT, octaveNr, bins, cqtKernel['firstcenter'], cqtKernel['atomHOP'], cqtKernel['atomNr'])
    
    intParam = {'sufZeros':suffixZeros,'preZeros':prefixZeros,'xlen_init':xlen_init,'fftLEN':cqtKernel['fftLEN'],'fftHOP':cqtKernel['fftHOP'],
        'q':q,'filtCoeffA':A,'filtCoeffB':B,'firstcenter':cqtKernel['firstcenter'],'atomHOP':cqtKernel['atomHOP'],
        'atomNr':cqtKernel['atomNr'],'Nk_max':cqtKernel['Nk_max'],'Q':cqtKernel['Q'],'rast':0}

    Xcqt = {'spCQT':spCQT,'fKernel':cqtKernel['fKernel'],'fmax':fmax,'fmin':fmin,'octaveNr':octaveNr,'bins':cqtKernel['bins'],'intParams':intParam}
    
    return Xcqt

def round_half_up(number, ndigits=0):  # 精确的四舍五入
    '''
    Ref: https://cloud.tencent.com/developer/article/1426211
    '''
    num = Decimal(str(number))
    return float(num.quantize(Decimal('0.'+'0'*ndigits), rounding=ROUND_HALF_UP))
    
def nextpow2(n):
    '''
    求最接近数据长度的2的整数次方
    An integer equal to 2 that is closest to the length of the data
    
    Ref: https://github.com/BIDS-Apps/rsHRF/blob/669ceac0e347224fbce2ae5f7d99adbe2725d2db/rsHRF/processing/rest_filter.py#L6
    
    Eg: 
    nextpow2(2) = 1
    nextpow2(2**10+1) = 11
    nextpow2(2**20+1) = 21
    '''
    return np.ceil(np.log2(np.abs(n))).astype('long')

def hann(window_length, sflag='symmetric'):
    """
    Returns a Hann window using the window sampling specified by `sflag.
  
    Args:
    
    window_length: The number of points in the returned window.
    sflag: Window sampling - 'symmetric' (default) | 'periodic'
        Window sampling, specified as one of the following:
        'symmetric' — Use this option when using windows for filter design.
            The Hanning window is defined as
            .. math::
                w(n) = 0.5 - 0.5\\cos\\left(\\frac{2\\pi{n}}{M-1}\\right)
                \\qquad 0 \\leq n \\leq M-1       

        'periodic' — This option is useful for spectral analysis because it 
                    enables a windowed signal to have the perfect periodic extension 
                    implicit in the discrete Fourier transform. When 'periodic' is specified, 
                    hann computes a window of length L + 1 and returns the first L points.

            Calculate a "periodic" Hann window.

            The classic Hann window is defined as a raised cosine that starts and
            ends on zero, and where every value appears twice, except the middle
            point for an odd-length window.  Matlab calls this a "symmetric" window
            and np.hanning() returns it.  However, for Fourier analysis, this
            actually represents just over one cycle of a period N-1 cosine, and
            thus is not compactly expressed on a length-N Fourier basis.  Instead,
            it's better to use a raised cosine that ends just before the final
            zero value - i.e. a complete cycle of a period-N cosine.  Matlab
            calls this a "periodic" window. This routine calculates it.

    Returns:
    A 1D np.array containing the periodic hann window.
    
    Ref: http://ddrv.cn/a/272066
    He Wang, 2020/12/01 hewang@mail.bnu.edu.cn
    """
    if sflag == 'symmetric': 
        return np.hanning(window_length)
    elif sflag == 'periodic':
        return 0.5 - (0.5 * np.cos(2 * np.pi / window_length *
                                 np.arange(window_length)))
    else:
        raise 

def genCQTkernel(fmax, bins, fs, **kwargs):
    '''
    %Calculating the CQT Kernel for one octave. All atoms are center-stacked. 
    %Atoms are placed so that the stacks of lower octaves are centered at the 
    %same positions in time, however, their amount is reduced by factor two for 
    %each octave down. 
    % 
    %INPUT: 
    %   fmax          ... highest frequency of interest 
    %   bins          ... number of bins per octave 
    %   fs            ... sampling frequency 
    % 
    %optional input parameters (parameter name/value pairs): 
    % 
    %   'q'             ... Q scaling factor. Default: 1. 
    %   'atomHopFactor' ... relative hop size corresponding to the shortest 
    %                       temporal atom. Default: 0.25. 
    %   'thresh'        ... values smaller than 'tresh' in the spectral kernel are rounded to 
    %                       zero. Default: 0.0005. 
    %   'win'           ... defines which window will be used for the CQT. Valid 
    %                       values are: 'blackman','hann' and 'blackmanharris'. To 
    %                       use the square root of each window use the prefix 'sqrt_' 
    %                      (i.e. 'sqrt_blackman'). Default: 'sqrt_blackmanharris' 
    %   'perfRast'      ... if set to 1 the kernel is designed in order to 
    %                       enable perfect rasterization using the function 
    %                       cqtPerfectRast() (Default: perRast=0). See documentation of 
    %                       'cqtPerfectRast' for further information. 
    % 
    %OUTPUT: 
    %   cqtKernel   ... Dict that contains the spectral kernel 'fKernel' 
    %                   additional design parameters used in cqt(), cqtPerfectRast() and icqt(). 
    % 
    %He Wang, 2020/12/01 hewang@mail.bnu.edu.cn
    '''
    # input parameters 
    q             = kwargs.get('q', 1)
    atomHopFactor = kwargs.get('atomHopFactor', 0.25)
    thresh        = kwargs.get('thresh', 0.0005)
    winFlag       = kwargs.get('win', 'sqrt_blackmanharris')
    perfRast      = kwargs.get('perfRast', 0)
        
    # define 
    fmin = (fmax/2)*2**(1/bins)
    Q = 1/(2**(1/bins)-1)
    Q = Q*q
    Nk_max = Q * fs / fmin
    Nk_max = round_half_up(Nk_max) # length of the largest atom [samples] 

    # Compute FFT size, FFT hop, atom hop, ... 
    Nk_min = round_half_up( Q * fs / (fmin*2**((bins-1)/bins)) ) # length of the shortest atom [samples] 
    atomHOP = round_half_up(Nk_min * atomHopFactor) # atom hop size 
    first_center = np.ceil(Nk_max/2) # first possible center position within the frame 
    first_center = atomHOP * np.ceil(first_center/atomHOP) # lock the first center to an integer multiple of the atom hop size 
    FFTLen = 2**nextpow2(first_center+np.ceil(Nk_max/2)) # use smallest possible FFT size (increase sparsity) 

    if perfRast:
        winNr = int(np.floor((FFTLen-np.ceil(Nk_max/2)-first_center)/atomHOP)) # number of temporal atoms per FFT Frame 
        if winNr == 0 :
            FFTLen = FFTLen * 2
            winNr = int(np.floor((FFTLen-np.ceil(Nk_max/2)-first_center)/atomHOP))
    else:
        winNr = int(np.floor((FFTLen-np.ceil(Nk_max/2)-first_center)/atomHOP))+1 # number of temporal atoms per FFT Frame 


    last_center = first_center + (winNr-1)*atomHOP
    fftHOP = (last_center + atomHOP) - first_center # hop size of FFT frames 
    fftOLP = (FFTLen-fftHOP/FFTLen)*100 # overlap of FFT frames in percent ***AK:needed? 
    
    # init variables 
    tempKernel= np.zeros((1, FFTLen), dtype=complex)
    sparKernel= np.zeros((1, FFTLen), dtype=complex)#[]
    
    # Compute kernel 
    atomInd = 0
    for k in range(bins):

        Nk = int(round_half_up( Q * fs / (fmin*2**(k/bins)) )) # N[k] = (fs/fk)*Q. Rounding will be omitted in future versions 
        
        if winFlag == 'sqrt_blackmanharris': 
            winFct = np.sqrt(blackmanharris(Nk))
        elif winFlag == 'blackmanharris': 
            winFct = blackmanharris(Nk)
        elif winFlag == 'sqrt_hann':
            winFct = np.sqrt(hann(Nk, 'periodic'))
        elif winFlag == 'hann':
            winFct = hann(Nk, 'periodic')
        elif winFag == 'sqrt_blackman':
            winFct = np.sqrt(blackman(Nk, False))
        elif winFag == 'blackman':
            winFct = blackman(Nk, False)
        else:
            winFct = np.sqrt(blackmanharris(Nk))
            if k==1:
                warnings.warn('QT:INPUT','Non-existing window function. Default window is used!', UserWarning)
            
        fk = fmin*2**(k/bins)
        tempKernelBin = (winFct/Nk) * np.exp(2*np.pi*1j*fk*np.arange(Nk)/fs)
        atomOffset = first_center - np.ceil(Nk/2)

        for i in range(winNr):
            shift = int(atomOffset + (i * atomHOP))

            tempKernel[:, shift: Nk+shift] = tempKernelBin

            atomInd += 1
            specKernel= np.fft.fft(tempKernel)
            specKernel[abs(specKernel)<=thresh] = 0 
            sparKernel = np.append(sparKernel, specKernel, axis=0)
            tempKernel = np.zeros((1, FFTLen), dtype=complex) # reset window   


    sparKernel = (sparKernel.T/FFTLen)[:,1:]

    # Normalize the magnitudes of the atoms 
    wx1=np.argmax(np.abs(sparKernel)[:,0])
    wx2=np.argmax(np.abs(sparKernel)[:,-1])
    wK=sparKernel[wx1: wx2+1,:]

    wK = np.diag(np.dot(wK, wK.conj().T))
    wK = wK[int(round_half_up(1/q)): -int(round_half_up(1/q))-2]
    weight = 1./np.mean(np.abs(wK))
    weight = weight * (fftHOP/FFTLen)
    weight = np.sqrt(weight) # sqrt because the same weight is applied in icqt again 
    sparKernel = weight*sparKernel

    return {'fKernel': sparKernel, 'fftLEN':FFTLen,'fftHOP':fftHOP,'fftOverlap':fftOLP,'perfRast':perfRast,
     'bins':bins,'firstcenter':first_center,'atomHOP':atomHOP,'atomNr':winNr,'Nk_max':Nk_max,'Q':Q,'fmin':fmin }

def cell2sparse(Xcq, octaves, bins, firstcenter, atomHOP, atomNr):
    '''
    %Generates a sparse matrix containing the CQT coefficients (rasterized). 
    % 
    %The sparse matrix representation of the CQT coefficients contains all 
    %computed coefficients at the corresponding time-frequency location 
    %(similar to a spectrogram). For lower frequencies this means, that 
    %each coefficient is followed by zeros stemming from the fact, that the time 
    %resolution for lower frequencies decreases as the frequency resolution 
    %increases. Due to the design of the CQT kernel, however, the coefficients 
    %of different octaves are synchronised, meaning that for the second highest 
    %octave each coefficient is followed by one zero, for the next octave down 
    %two zeros are inserted, for the next octave four zeros are inserted and so 
    %on. 
    % 
    %INPUT: 
    %   Xcq         ... Dict array consisting of all coefficients for all octaves 
    %   octaves     ... Number of octaves processed 
    %   bins        ... Number of bins per octave 
    %   firstcenter ... Location of the leftmost atom-stack in the temporal 
    %                   kernel 
    %   atomHOP     ... Spacing of two consecutive atom stacks 
    %   atomNr      ... Number of atoms per bin within the kernel 
    % 
    %%He Wang, 2020/12/01 hewang@mail.bnu.edu.cn
    '''     
    
    
    
    # this version uses less memory but is noticable slower 
    emptyHops = firstcenter/atomHOP
    drops = emptyHops*np.power(2, octaves - np.arange(1, octaves + 1)) - emptyHops
    Len = int(np.max((np.asarray([atomNr*c.shape[1] for _,c in Xcq.items()]) - drops) * np.power(2, np.arange(octaves)))) # number of columns of output matrix 
    spCQT = np.empty((0,Len)).astype(np.complex)

    for i in range(1, octaves+1)[::-1]:
        drop = int(emptyHops*2**(octaves-i)-emptyHops) # first coefficients of all octaves have to be in synchrony 
        X = Xcq[i]

        if  atomNr > 1: # more than one atom per bin --> reshape 
            Xoct = np.zeros((bins, atomNr*X.shape[1] - drop)).astype(np.complex)
            for u in range(bins): # reshape to continous windows for each bin (for the case of several wins per frame) 
                octX_bin = X[u*atomNr:(u+1)*atomNr,:]
                Xcont = octX_bin.T.reshape(-1)
                Xoct[u,:] = Xcont[drop:]
            X = Xoct

        else:
            X = X[:,drop:]

        X = np.pad(upfirdn([1], X.T, 2**(i-1), axis=0), [[0,2**(i-1)-1],[0,0]], mode='constant').T # upfirdn: upsampling with zeros insertion
        X = np.append(X, np.zeros((bins, Len-X.shape[1])), axis=1)

        spCQT = np.append(spCQT, X, axis=0)
            
    return spCQT

def getCQT(Xcqt, fSlice, tSlice, iFlag):
    '''
    %outCQ = getCQT(Xcqt,fSlice,tSlice,iFlag) computes a rasterized representation of 
    %the amplitudes of the calculated CQT coefficients for the frequency bins definded in vector fSlice and the 
    %points in time (time frames) defined in vector tSlice using the interpolation method defined in iFlag. 
    %Valid values for iFlag are:
    %
    %'linear'  ... linear interpolation (default)
    %'spline'  ... spline interpolation
    %'nearest' ... nearest neighbor interpolation
    %'cubic'   ... piecewise cubic interpolation
    %
    %If the entire CQT representation should be rasterized, set fSlice and
    %tSlice to 'all'.
    %The input parameter Xcqt is the structure gained using cqt(...).
    %The output parameter 'intCQT' is the same size as Xcqt.spCQT but is no
    %longer sparse since the zeros between two coefficients are replaced by
    %the interpolated values. The coefficients stored in 'intCQT' are now
    %real-valued since only the absolute values of the coefficients are
    %interpolated. If a spectrogram-like (rasterized) version of the CQT
    %coefficients including phase information is required, use the function
    %cqtPerfectRast() (see documentation for further information)
    %
    %%He Wang, 2020/12/01 hewang@mail.bnu.edu.cn
    '''    
    if type(fSlice) == type(''):
        fSlice = np.arange(Xcqt['bins'] * Xcqt['octaveNr'])
    if type(tSlice) == type(''):
        lastEnt = Xcqt['spCQT'][0,:].nonzero()[0][-1]
        tSlice = range(lastEnt)


    intCQT = np.zeros((len(fSlice),len(tSlice)))
    bins = Xcqt['bins']
    spCQT = Xcqt['spCQT']
    octaveNr = Xcqt['octaveNr']
    spCQT = spCQT.T
    
    for k in range(len(fSlice)):
        Oct = octaveNr-np.floor((fSlice[k]-0.1)/bins)
        stepVec = range(0, spCQT.shape[0], int(2**(Oct-1)))
        Xbin = spCQT[stepVec, fSlice[k]]
        intCQT[k,:] = np.interp(tSlice, stepVec, abs(Xbin))
    return intCQT

def plotCQT(Xcqt, fs, fcomp):
    '''
    %plotCQT(Xcqt,fs,fcomp,method) plots the magnitudes of the CQT 
    %coefficients similar to a spectrogram using linear interpolation 
    %between the calculated coefficients. For better illustration, the
    %magnitude values can be compressed using fcomp < 1 (Xmag^fcomp).
    %
    %%He Wang, 2020/12/13 hewang@mail.bnu.edu.cn
    '''
    if Xcqt['intParams']['rast']:
        absCQT = np.abs(Xcqt['spCQT'])
    else:
        absCQT = getCQT(Xcqt, 'all', 'all', 'linear')
        

    emptyHops = Xcqt['intParams']['firstcenter'] / Xcqt['intParams']['atomHOP']
    maxDrop = emptyHops * 2**(Xcqt['octaveNr']-1)-emptyHops
    droppedSamples = (maxDrop-1) * Xcqt['intParams']['atomHOP'] + Xcqt['intParams']['firstcenter']
    outputTimeVec = np.arange(1, absCQT.shape[1]+1) * Xcqt['intParams']['atomHOP']-Xcqt['intParams']['preZeros']+droppedSamples

    xout = outputTimeVec / fs
    ytickarray = np.arange(1, Xcqt['octaveNr']*Xcqt['bins'], Xcqt['bins']/2)
    yout = Xcqt['fmin'] * 2**((ytickarray-1)/Xcqt['bins'])
    yTickLabel = Xcqt['fmin']*2**((ytickarray-1)/Xcqt['bins'])
    
    X_cq_rast = absCQT**fcomp # compress magnitudes
    fig, ax = plt.subplots(1, 1, sharex=True)
    ax.imshow(abs(X_cq_rast), origin='lower', vmin=np.min(X_cq_rast), vmax=np.max(X_cq_rast),)
    ax.axis('tight')
    ax.set_xlabel('time [sec]')
    ax.set_ylabel('frequency [Hz]')
    ax.set_title('Constant Q transform', fontdict={'fontsize':12})
    plt.yticks(ytickarray, [int(round_half_up(i)) for i in yTickLabel])
    fsp = int(1/(xout[1] - xout[0]))
    plt.xticks(np.arange(xout.size)[fsp//2::fsp], np.round(xout[fsp//2::fsp],1))
    return (ytickarray, yout), xout

def sparse2cell(spCQT,bins,octaveNr,atomNr,firstcenter,atomHOP):
    '''
    % Maps the sparse matrix respresentation of the CQT coefficients back to 
    % the cell representation for inverse transform 
    % 
    %%He Wang, 2020/12/13 hewang@mail.bnu.edu.cn
    '''
    emptyHops = firstcenter/atomHOP # void atom hopsizes in the beginning of the temporal kernel 
    cellCQT = {}

    for i in range(1, octaveNr+1):
        dropped = int(emptyHops*2**(octaveNr-i)-emptyHops)
        X = spCQT[bins*octaveNr-i*bins:bins*octaveNr-(i-1)*bins,::2**(i-1)]
        X = np.concatenate([np.zeros((bins,dropped)), X], axis=-1)
        X = np.concatenate([X, np.zeros((bins,int(np.ceil(X.shape[1]/atomNr))*atomNr-X.shape[1]))], axis=-1)
        if atomNr > 1: # reshape 
            Xcell = np.zeros((bins*atomNr,int(np.ceil(X.shape[1]/atomNr)))).astype(np.complex)
            for u in range(1,bins+1):
                Xbin = np.reshape(X[u-1,:], (atomNr,int(len(X[u-1,:])/atomNr)), order='F')
                Xcell[(u-1)*atomNr:u*atomNr, :] = Xbin
            cellCQT[i] = Xcell
        else:
            cellCQT[i] = X
    
    return cellCQT



def icqt(Xcqt):
    '''
    %y = icqt(Xcqt) computes the inverse CQT of the CQT coefficients in Xcqt.spCQT 
    % 
    %The input structue Xcqt is the structure gained by cqt() and cqtPerfectRast(), respectively.  
    %If the CQT coefficients in Xcqt.spCQT are not changed, the output y is the 
    %reconstructed (near-perfect) time-domain signal of the input signal x 
    %(cqt(x,...)) withing the frequency range [fmin fmax]. 
    % 
    %%He Wang, 2020/12/13 hewang@mail.bnu.edu.cn
    '''
    cellCQT = sparse2cell(Xcqt['spCQT'],Xcqt['bins'],Xcqt['octaveNr'],Xcqt['intParams']['atomNr'],
                          Xcqt['intParams']['firstcenter'],Xcqt['intParams']['atomHOP'])

    FFTLen = Xcqt['intParams']['fftLEN']
    octaveNr = Xcqt['octaveNr']
    HOPSZ = int(Xcqt['intParams']['fftHOP'])
    
    # Kernel for inverse transform 
    Kinv = Xcqt['fKernel']
    
    # inverse transform 
    y = np.array([])
    
    for i in np.arange(1,octaveNr+1,1)[::-1]:
        cellCQT_oct = cellCQT[i]
        Y = np.dot(Kinv, cellCQT_oct) # compute spectrum of reconstructed signal for all coefficients in this octave   
        y_oct_temp = np.fft.ifft(Y.T).T
        y_oct = 2*np.real(y_oct_temp)  # Y contains no negative frequencies -> keep only real part*2 to  
                                    # reconstruct real valued time signal  
        NBLOCKS = Y.shape[1]
        siglen = int(FFTLen + (NBLOCKS-1)*HOPSZ)
        y = np.append(y, np.zeros((siglen-len(y),))) if siglen-len(y)>0 else y

        for n in range(NBLOCKS):
            y[n*HOPSZ:(n*HOPSZ)+FFTLen] = y_oct[:,n] + y[n*HOPSZ:(n*HOPSZ)+FFTLen] # overlap-add 

        if i != 1: # upsampling by factor two
            #y = sum(map(lambda x: [x, 0], y), []) # insert one zero between each sample 
            y = upsample(y, 2) # insert one zero between each sample 
            y = filtfilt(Xcqt['intParams']['filtCoeffB'], Xcqt['intParams']['filtCoeffA'],y)
            y *= 2
    return y
