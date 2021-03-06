<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<title>/icqt.m - Constant-Q Transform Toolbox - Sound Software .ac.uk</title>
<meta name="description" content="A repository for software developed and published by audio and music researchers in the UK." />
<meta name="keywords" content="audio,music,software,research,UK,sound,repository,code,redmine" />
<meta content="authenticity_token" name="csrf-param" />
<meta content="/LY64UMufD2i54JcAZr8SJ+lxGl2hhdmCCgTYtuXbKA=" name="csrf-token" />
<link rel='shortcut icon' href='/favicon.ico?1504003854' />
<link href="/stylesheets/jquery/jquery-ui-1.9.2.css?1504003854" media="all" rel="stylesheet" type="text/css" />
<link href="/themes/soundsoftware/stylesheets/application.css?1504003854" media="all" rel="stylesheet" type="text/css" />
<link href="/themes/soundsoftware/stylesheets/fonts-mac.css?1504003854" media="all" rel="stylesheet" type="text/css" />

<script src="/javascripts/jquery-1.8.3-ui-1.9.2-ujs-2.0.3.js?1504003854" type="text/javascript"></script>
<script src="/javascripts/application.js?1504003854" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
$(window).load(function(){ warnLeavingUnsaved('若离开当前页面，则该页面内未保存的内容将丢失。'); });
//]]>
</script>


<!-- page specific tags -->
  <link href="/plugin_assets/redmine_checkout/stylesheets/checkout.css?1504005182" media="screen" rel="stylesheet" type="text/css" />
  <script src="/javascripts/repository_navigation.js?1504003854" type="text/javascript"></script>
<link href="/stylesheets/scm.css?1504003854" media="screen" rel="stylesheet" type="text/css" />
</head>
<body class="theme-Soundsoftware project-constant-q-toolbox controller-repositories action-entry">
<div id="wrapper">
<div id="wrapper2">
<div id="wrapper3">
<div id="top-menu">
    <div id="account">
        <ul><li><a href="/login" class="login">登录</a></li>
<li><a href="/account/register" class="register">注册</a></li></ul>    </div>
    
    <ul><li><a href="/" class="home">主页</a></li>
<li><a href="/explore" class="projects">项目</a></li>
<li><a href="/projects/soundsoftware-site/wiki/Help" class="help">帮助</a></li></ul></div>

<div class="header-project" id="header">
    <div id="project-search-jump">
      <div id="quick-search">
        <form accept-charset="UTF-8" action="/projects/constant-q-toolbox/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
        <input name="changesets" type="hidden" value="1" />
        <label for='q'>
          <a href="/projects/constant-q-toolbox/search" accesskey="4">搜索</a>:
        </label>
          <input accesskey="f" class="small" id="q" name="q" size="20" type="text" />
</form>      </div>

      <div id="project-jump-box">
        
      </div>
    </div>


    <h1 id="project-title"
    >
       <a href="/projects/constant-q-toolbox">Constant-Q Transform Toolbox</a>
    </h1>

    <div id="main-menu">
        <ul><li><a href="/projects/constant-q-toolbox" class="overview">概述</a></li>
<li><a href="/projects/constant-q-toolbox/memberships" class="members">Members</a></li>
<li><a href="/projects/constant-q-toolbox/activity" class="activity">活动</a></li>
<li><a href="/publications?project_id=constant-q-toolbox" class="publications">Publications</a></li>
<li><a href="/projects/constant-q-toolbox/repository" class="repository selected">版本库</a></li>
<li><a href="/projects/constant-q-toolbox/embedded" class="redmine-embedded">Code docs</a></li></ul>
    </div>
</div>

<div id="main" class="nosidebar">
    <div id="sidebar">
        
        
    </div>

    <div id="content">
        
        

<div class="repository-info">
  <div class="wiki bottomline"><p>To check out this repository please <code>hg clone</code> the following URL, or open the URL using <a href="http://easyhg.org" class="external">EasyMercurial</a> or your preferred Mercurial client.</p></div>
  <div id="checkout_box">
    <ul id="checkout_protocols">
      <li>
        <a class=&quot;selected&quot; id="checkout_protocol_mercurial" data-permission="read-only" href="https://code.soundsoftware.ac.uk/hg/constant-q-toolbox">Mercurial</a>
      </li>
    </ul>
    <input id="checkout_url" name="checkout_url" readonly="readonly" type="text" value="https://code.soundsoftware.ac.uk/hg/constant-q-toolbox" />

    <p>
      &nbsp;
    </p>


  </div>
</div>
<div style="clear: left"></div>


<div class="contextual">
  
<a href="/projects/constant-q-toolbox/repository/statistics" class="icon icon-stats">统计</a>

<a class="icon icon-package" href="/hg/constant-q-toolbox/archive/tip.zip">Download as Zip</a>

<form accept-charset="UTF-8" action="/projects/constant-q-toolbox/repository/entry/icqt.m" id="revision_selector" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>  <!-- Branches Dropdown -->
    | 分支: 
    <select id="branch" name="branch"><option value="">&nbsp;</option>
<option value="default">default</option></select>


    | 修订: 
    <input id="rev" name="rev" size="8" type="text" />
</form>


</div>

<h2><a href="/projects/constant-q-toolbox/repository">root</a>
    / <a href="/projects/constant-q-toolbox/repository/changes/icqt.m">icqt.m</a>


</h2>


<p>
<a href="/projects/constant-q-toolbox/repository/changes/icqt.m">历史记录</a> |
    查看 |
    <a href="/projects/constant-q-toolbox/repository/annotate/icqt.m">追溯</a> |
<a href="/projects/constant-q-toolbox/repository/raw/icqt.m">下载</a>
(1.735 KB)
</p>



  <div class="autoscroll">
<table class="filecontent syntaxhl">
<tbody>
  <tr id="L1">
    <th class="line-num">
      <a href="#L1">1</a>
    </th>
    <td class="line-code">
      <pre>function y = icqt(Xcqt)
</pre>
    </td>
  </tr>
  <tr id="L2">
    <th class="line-num">
      <a href="#L2">2</a>
    </th>
    <td class="line-code">
      <pre>%y = icqt(Xcqt) computes the inverse CQT of the CQT coefficients in Xcqt.spCQT
</pre>
    </td>
  </tr>
  <tr id="L3">
    <th class="line-num">
      <a href="#L3">3</a>
    </th>
    <td class="line-code">
      <pre>%
</pre>
    </td>
  </tr>
  <tr id="L4">
    <th class="line-num">
      <a href="#L4">4</a>
    </th>
    <td class="line-code">
      <pre>%The input structue Xcqt is the structure gained by cqt() and cqtPerfectRast(), respectively. 
</pre>
    </td>
  </tr>
  <tr id="L5">
    <th class="line-num">
      <a href="#L5">5</a>
    </th>
    <td class="line-code">
      <pre>%If the CQT coefficients in Xcqt.spCQT are not changed, the output y is the
</pre>
    </td>
  </tr>
  <tr id="L6">
    <th class="line-num">
      <a href="#L6">6</a>
    </th>
    <td class="line-code">
      <pre>%reconstructed (near-perfect) time-domain signal of the input signal x
</pre>
    </td>
  </tr>
  <tr id="L7">
    <th class="line-num">
      <a href="#L7">7</a>
    </th>
    <td class="line-code">
      <pre>%(cqt(x,...)) withing the frequency range [fmin fmax].
</pre>
    </td>
  </tr>
  <tr id="L8">
    <th class="line-num">
      <a href="#L8">8</a>
    </th>
    <td class="line-code">
      <pre>%
</pre>
    </td>
  </tr>
  <tr id="L9">
    <th class="line-num">
      <a href="#L9">9</a>
    </th>
    <td class="line-code">
      <pre>%Christian Sch?rkhuber, Anssi Klapuri 2010-06
</pre>
    </td>
  </tr>
  <tr id="L10">
    <th class="line-num">
      <a href="#L10">10</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L11">
    <th class="line-num">
      <a href="#L11">11</a>
    </th>
    <td class="line-code">
      <pre>cellCQT = sparse2cell(Xcqt.spCQT,Xcqt.bins,Xcqt.octaveNr,Xcqt.intParams.atomNr,Xcqt.intParams.firstcenter,Xcqt.intParams.atomHOP);
</pre>
    </td>
  </tr>
  <tr id="L12">
    <th class="line-num">
      <a href="#L12">12</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L13">
    <th class="line-num">
      <a href="#L13">13</a>
    </th>
    <td class="line-code">
      <pre>FFTLen = Xcqt.intParams.fftLEN;
</pre>
    </td>
  </tr>
  <tr id="L14">
    <th class="line-num">
      <a href="#L14">14</a>
    </th>
    <td class="line-code">
      <pre>octaveNr = Xcqt.octaveNr;
</pre>
    </td>
  </tr>
  <tr id="L15">
    <th class="line-num">
      <a href="#L15">15</a>
    </th>
    <td class="line-code">
      <pre>HOPSZ = Xcqt.intParams.fftHOP;
</pre>
    </td>
  </tr>
  <tr id="L16">
    <th class="line-num">
      <a href="#L16">16</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L17">
    <th class="line-num">
      <a href="#L17">17</a>
    </th>
    <td class="line-code">
      <pre>%% Kernel for inverse transform
</pre>
    </td>
  </tr>
  <tr id="L18">
    <th class="line-num">
      <a href="#L18">18</a>
    </th>
    <td class="line-code">
      <pre>Kinv = Xcqt.fKernel;
</pre>
    </td>
  </tr>
  <tr id="L19">
    <th class="line-num">
      <a href="#L19">19</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L20">
    <th class="line-num">
      <a href="#L20">20</a>
    </th>
    <td class="line-code">
      <pre>%% inverse transform
</pre>
    </td>
  </tr>
  <tr id="L21">
    <th class="line-num">
      <a href="#L21">21</a>
    </th>
    <td class="line-code">
      <pre>y = [];
</pre>
    </td>
  </tr>
  <tr id="L22">
    <th class="line-num">
      <a href="#L22">22</a>
    </th>
    <td class="line-code">
      <pre>for i = octaveNr:-1:1
</pre>
    </td>
  </tr>
  <tr id="L23">
    <th class="line-num">
      <a href="#L23">23</a>
    </th>
    <td class="line-code">
      <pre>    cellCQT_oct = cellCQT{i};    
</pre>
    </td>
  </tr>
  <tr id="L24">
    <th class="line-num">
      <a href="#L24">24</a>
    </th>
    <td class="line-code">
      <pre>    Y = Kinv * cellCQT_oct; %compute spectrum of reconstructed signal for all coefficients in this octave  
</pre>
    </td>
  </tr>
  <tr id="L25">
    <th class="line-num">
      <a href="#L25">25</a>
    </th>
    <td class="line-code">
      <pre>    y_oct_temp = ifft(Y);
</pre>
    </td>
  </tr>
  <tr id="L26">
    <th class="line-num">
      <a href="#L26">26</a>
    </th>
    <td class="line-code">
      <pre>    y_oct = 2*real(y_oct_temp); %Y contains no negative frequencies -&gt; keep only real part*2 to 
</pre>
    </td>
  </tr>
  <tr id="L27">
    <th class="line-num">
      <a href="#L27">27</a>
    </th>
    <td class="line-code">
      <pre>                                %reconstruct real valued time signal 
</pre>
    </td>
  </tr>
  <tr id="L28">
    <th class="line-num">
      <a href="#L28">28</a>
    </th>
    <td class="line-code">
      <pre>    NBLOCKS = size(Y,2);      
</pre>
    </td>
  </tr>
  <tr id="L29">
    <th class="line-num">
      <a href="#L29">29</a>
    </th>
    <td class="line-code">
      <pre>    siglen = FFTLen + (NBLOCKS-1)*HOPSZ;
</pre>
    </td>
  </tr>
  <tr id="L30">
    <th class="line-num">
      <a href="#L30">30</a>
    </th>
    <td class="line-code">
      <pre>    y = [y;zeros(siglen-length(y),1)];
</pre>
    </td>
  </tr>
  <tr id="L31">
    <th class="line-num">
      <a href="#L31">31</a>
    </th>
    <td class="line-code">
      <pre>    for n = 1:NBLOCKS
</pre>
    </td>
  </tr>
  <tr id="L32">
    <th class="line-num">
      <a href="#L32">32</a>
    </th>
    <td class="line-code">
      <pre>        y((n-1)*HOPSZ+1:((n-1)*HOPSZ)+FFTLen) = y_oct(:,n) + y((n-1)*HOPSZ+1:((n-1)*HOPSZ)+FFTLen); %overlap-add
</pre>
    </td>
  </tr>
  <tr id="L33">
    <th class="line-num">
      <a href="#L33">33</a>
    </th>
    <td class="line-code">
      <pre>    end
</pre>
    </td>
  </tr>
  <tr id="L34">
    <th class="line-num">
      <a href="#L34">34</a>
    </th>
    <td class="line-code">
      <pre>    
</pre>
    </td>
  </tr>
  <tr id="L35">
    <th class="line-num">
      <a href="#L35">35</a>
    </th>
    <td class="line-code">
      <pre>    if(i~=1) %upsampling by factor two
</pre>
    </td>
  </tr>
  <tr id="L36">
    <th class="line-num">
      <a href="#L36">36</a>
    </th>
    <td class="line-code">
      <pre>         y = upsample(y,2); %insert one zero between each sample
</pre>
    </td>
  </tr>
  <tr id="L37">
    <th class="line-num">
      <a href="#L37">37</a>
    </th>
    <td class="line-code">
      <pre>         y = filtfilt(Xcqt.intParams.filtCoeffB,Xcqt.intParams.filtCoeffA,y);
</pre>
    </td>
  </tr>
  <tr id="L38">
    <th class="line-num">
      <a href="#L38">38</a>
    </th>
    <td class="line-code">
      <pre>         y = y * 2;
</pre>
    </td>
  </tr>
  <tr id="L39">
    <th class="line-num">
      <a href="#L39">39</a>
    </th>
    <td class="line-code">
      <pre>    end
</pre>
    </td>
  </tr>
  <tr id="L40">
    <th class="line-num">
      <a href="#L40">40</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L41">
    <th class="line-num">
      <a href="#L41">41</a>
    </th>
    <td class="line-code">
      <pre>end
</pre>
    </td>
  </tr>
  <tr id="L42">
    <th class="line-num">
      <a href="#L42">42</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L43">
    <th class="line-num">
      <a href="#L43">43</a>
    </th>
    <td class="line-code">
      <pre>y = y(Xcqt.intParams.preZeros+1:end); %crop introduced zeros at the beginning
</pre>
    </td>
  </tr>
  <tr id="L44">
    <th class="line-num">
      <a href="#L44">44</a>
    </th>
    <td class="line-code">
      <pre>y = y(1:Xcqt.intParams.xlen_init); %crop overhead zeros at the end
</pre>
    </td>
  </tr>
</tbody>
</table>
</div>



        
        <div style="clear:both;"></div>
    </div>
</div>
</div>

<div id="ajax-indicator" style="display:none;"><span>载入中...</span></div>
<div id="ajax-modal" style="display:none;"></div>

<div id="footer">
  <div class="bgl"><div class="bgr">
    <small>Operated by <a href="http://soundsoftware.ac.uk/">SoundSoftware.ac.uk</a> &ndash; <a href="mailto:info@soundsoftware.ac.uk">contact us</a><br>Powered by <a href="http://www.redmine.org/">Redmine</a></small>
  </div></div>
</div>
</div>
</div>

</body>
</html>
