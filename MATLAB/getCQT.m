<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<title>/getCQT.m - Constant-Q Transform Toolbox - Sound Software .ac.uk</title>
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

<form accept-charset="UTF-8" action="/projects/constant-q-toolbox/repository/entry/getCQT.m" id="revision_selector" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>  <!-- Branches Dropdown -->
    | 分支: 
    <select id="branch" name="branch"><option value="">&nbsp;</option>
<option value="default">default</option></select>


    | 修订: 
    <input id="rev" name="rev" size="8" type="text" />
</form>


</div>

<h2><a href="/projects/constant-q-toolbox/repository">root</a>
    / <a href="/projects/constant-q-toolbox/repository/changes/getCQT.m">getCQT.m</a>


</h2>


<p>
<a href="/projects/constant-q-toolbox/repository/changes/getCQT.m">历史记录</a> |
    查看 |
    <a href="/projects/constant-q-toolbox/repository/annotate/getCQT.m">追溯</a> |
<a href="/projects/constant-q-toolbox/repository/raw/getCQT.m">下载</a>
(1.741 KB)
</p>



  <div class="autoscroll">
<table class="filecontent syntaxhl">
<tbody>
  <tr id="L1">
    <th class="line-num">
      <a href="#L1">1</a>
    </th>
    <td class="line-code">
      <pre>function intCQT = getCQT(Xcqt,fSlice,tSlice,iFlag)
</pre>
    </td>
  </tr>
  <tr id="L2">
    <th class="line-num">
      <a href="#L2">2</a>
    </th>
    <td class="line-code">
      <pre>%outCQ = getCQT(Xcqt,fSlice,tSlice,iFlag) computes a rasterized representation of 
</pre>
    </td>
  </tr>
  <tr id="L3">
    <th class="line-num">
      <a href="#L3">3</a>
    </th>
    <td class="line-code">
      <pre>%the amplitudes of the calculated CQT coefficients for the frequency bins definded in vector fSlice and the 
</pre>
    </td>
  </tr>
  <tr id="L4">
    <th class="line-num">
      <a href="#L4">4</a>
    </th>
    <td class="line-code">
      <pre>%points in time (time frames) defined in vector tSlice using the interpolation method defined in iFlag. 
</pre>
    </td>
  </tr>
  <tr id="L5">
    <th class="line-num">
      <a href="#L5">5</a>
    </th>
    <td class="line-code">
      <pre>%Valid values for iFlag are:
</pre>
    </td>
  </tr>
  <tr id="L6">
    <th class="line-num">
      <a href="#L6">6</a>
    </th>
    <td class="line-code">
      <pre>%
</pre>
    </td>
  </tr>
  <tr id="L7">
    <th class="line-num">
      <a href="#L7">7</a>
    </th>
    <td class="line-code">
      <pre>%&#x27;linear&#x27;  ... linear interpolation (default)
</pre>
    </td>
  </tr>
  <tr id="L8">
    <th class="line-num">
      <a href="#L8">8</a>
    </th>
    <td class="line-code">
      <pre>%&#x27;spline&#x27;  ... spline interpolation
</pre>
    </td>
  </tr>
  <tr id="L9">
    <th class="line-num">
      <a href="#L9">9</a>
    </th>
    <td class="line-code">
      <pre>%&#x27;nearest&#x27; ... nearest neighbor interpolation
</pre>
    </td>
  </tr>
  <tr id="L10">
    <th class="line-num">
      <a href="#L10">10</a>
    </th>
    <td class="line-code">
      <pre>%&#x27;cubic&#x27;   ... piecewise cubic interpolation
</pre>
    </td>
  </tr>
  <tr id="L11">
    <th class="line-num">
      <a href="#L11">11</a>
    </th>
    <td class="line-code">
      <pre>%
</pre>
    </td>
  </tr>
  <tr id="L12">
    <th class="line-num">
      <a href="#L12">12</a>
    </th>
    <td class="line-code">
      <pre>%If the entire CQT representation should be rasterized, set fSlice and
</pre>
    </td>
  </tr>
  <tr id="L13">
    <th class="line-num">
      <a href="#L13">13</a>
    </th>
    <td class="line-code">
      <pre>%tSlice to &#x27;all&#x27;.
</pre>
    </td>
  </tr>
  <tr id="L14">
    <th class="line-num">
      <a href="#L14">14</a>
    </th>
    <td class="line-code">
      <pre>%The input parameter Xcqt is the structure gained using cqt(...).
</pre>
    </td>
  </tr>
  <tr id="L15">
    <th class="line-num">
      <a href="#L15">15</a>
    </th>
    <td class="line-code">
      <pre>%The output parameter &#x27;intCQT&#x27; is the same size as Xcqt.spCQT but is no
</pre>
    </td>
  </tr>
  <tr id="L16">
    <th class="line-num">
      <a href="#L16">16</a>
    </th>
    <td class="line-code">
      <pre>%longer sparse since the zeros between two coefficients are replaced by
</pre>
    </td>
  </tr>
  <tr id="L17">
    <th class="line-num">
      <a href="#L17">17</a>
    </th>
    <td class="line-code">
      <pre>%the interpolated values. The coefficients stored in &#x27;intCQT&#x27; are now
</pre>
    </td>
  </tr>
  <tr id="L18">
    <th class="line-num">
      <a href="#L18">18</a>
    </th>
    <td class="line-code">
      <pre>%real-valued since only the absolute values of the coefficients are
</pre>
    </td>
  </tr>
  <tr id="L19">
    <th class="line-num">
      <a href="#L19">19</a>
    </th>
    <td class="line-code">
      <pre>%interpolated. If a spectrogram-like (rasterized) version of the CQT
</pre>
    </td>
  </tr>
  <tr id="L20">
    <th class="line-num">
      <a href="#L20">20</a>
    </th>
    <td class="line-code">
      <pre>%coefficients including phase information is required, use the function
</pre>
    </td>
  </tr>
  <tr id="L21">
    <th class="line-num">
      <a href="#L21">21</a>
    </th>
    <td class="line-code">
      <pre>%cqtPerfectRast() (see documentation for further information)
</pre>
    </td>
  </tr>
  <tr id="L22">
    <th class="line-num">
      <a href="#L22">22</a>
    </th>
    <td class="line-code">
      <pre>%
</pre>
    </td>
  </tr>
  <tr id="L23">
    <th class="line-num">
      <a href="#L23">23</a>
    </th>
    <td class="line-code">
      <pre>%Christian Sch?rkhuber, Anssi Klapuri 2010-06
</pre>
    </td>
  </tr>
  <tr id="L24">
    <th class="line-num">
      <a href="#L24">24</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L25">
    <th class="line-num">
      <a href="#L25">25</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L26">
    <th class="line-num">
      <a href="#L26">26</a>
    </th>
    <td class="line-code">
      <pre>if ischar(fSlice), fSlice = 1:(Xcqt.bins*Xcqt.octaveNr); end;
</pre>
    </td>
  </tr>
  <tr id="L27">
    <th class="line-num">
      <a href="#L27">27</a>
    </th>
    <td class="line-code">
      <pre>if ischar(tSlice)
</pre>
    </td>
  </tr>
  <tr id="L28">
    <th class="line-num">
      <a href="#L28">28</a>
    </th>
    <td class="line-code">
      <pre>    lastEnt = find(Xcqt.spCQT(1,:),1,&#x27;last&#x27;);
</pre>
    </td>
  </tr>
  <tr id="L29">
    <th class="line-num">
      <a href="#L29">29</a>
    </th>
    <td class="line-code">
      <pre>    tSlice = 1:lastEnt;
</pre>
    </td>
  </tr>
  <tr id="L30">
    <th class="line-num">
      <a href="#L30">30</a>
    </th>
    <td class="line-code">
      <pre>end
</pre>
    </td>
  </tr>
  <tr id="L31">
    <th class="line-num">
      <a href="#L31">31</a>
    </th>
    <td class="line-code">
      <pre>if nargin &lt; 4, iFlag = &#x27;linear&#x27;; end;
</pre>
    </td>
  </tr>
  <tr id="L32">
    <th class="line-num">
      <a href="#L32">32</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L33">
    <th class="line-num">
      <a href="#L33">33</a>
    </th>
    <td class="line-code">
      <pre>intCQT = zeros(length(fSlice),length(tSlice));
</pre>
    </td>
  </tr>
  <tr id="L34">
    <th class="line-num">
      <a href="#L34">34</a>
    </th>
    <td class="line-code">
      <pre>bins = Xcqt.bins;
</pre>
    </td>
  </tr>
  <tr id="L35">
    <th class="line-num">
      <a href="#L35">35</a>
    </th>
    <td class="line-code">
      <pre>spCQT = Xcqt.spCQT;
</pre>
    </td>
  </tr>
  <tr id="L36">
    <th class="line-num">
      <a href="#L36">36</a>
    </th>
    <td class="line-code">
      <pre>octaveNr = Xcqt.octaveNr;
</pre>
    </td>
  </tr>
  <tr id="L37">
    <th class="line-num">
      <a href="#L37">37</a>
    </th>
    <td class="line-code">
      <pre>spCQT = spCQT.&#x27;;
</pre>
    </td>
  </tr>
  <tr id="L38">
    <th class="line-num">
      <a href="#L38">38</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L39">
    <th class="line-num">
      <a href="#L39">39</a>
    </th>
    <td class="line-code">
      <pre>for k=1:length(fSlice)
</pre>
    </td>
  </tr>
  <tr id="L40">
    <th class="line-num">
      <a href="#L40">40</a>
    </th>
    <td class="line-code">
      <pre>   oct = octaveNr-floor((fSlice(k)-0.1)/bins);
</pre>
    </td>
  </tr>
  <tr id="L41">
    <th class="line-num">
      <a href="#L41">41</a>
    </th>
    <td class="line-code">
      <pre>   stepVec = 1:2^(oct-1):size(spCQT,1);
</pre>
    </td>
  </tr>
  <tr id="L42">
    <th class="line-num">
      <a href="#L42">42</a>
    </th>
    <td class="line-code">
      <pre>   Xbin = full(spCQT(stepVec,fSlice(k)));
</pre>
    </td>
  </tr>
  <tr id="L43">
    <th class="line-num">
      <a href="#L43">43</a>
    </th>
    <td class="line-code">
      <pre>   intCQT(k,:) = interp1(stepVec,abs(Xbin),tSlice,iFlag);
</pre>
    </td>
  </tr>
  <tr id="L44">
    <th class="line-num">
      <a href="#L44">44</a>
    </th>
    <td class="line-code">
      <pre>end
</pre>
    </td>
  </tr>
  <tr id="L45">
    <th class="line-num">
      <a href="#L45">45</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L46">
    <th class="line-num">
      <a href="#L46">46</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L47">
    <th class="line-num">
      <a href="#L47">47</a>
    </th>
    <td class="line-code">
      <pre>
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
