<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<title>/sparse2cell.m - Constant-Q Transform Toolbox - Sound Software .ac.uk</title>
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

<form accept-charset="UTF-8" action="/projects/constant-q-toolbox/repository/entry/sparse2cell.m" id="revision_selector" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>  <!-- Branches Dropdown -->
    | 分支: 
    <select id="branch" name="branch"><option value="">&nbsp;</option>
<option value="default">default</option></select>


    | 修订: 
    <input id="rev" name="rev" size="8" type="text" />
</form>


</div>

<h2><a href="/projects/constant-q-toolbox/repository">root</a>
    / <a href="/projects/constant-q-toolbox/repository/changes/sparse2cell.m">sparse2cell.m</a>


</h2>


<p>
<a href="/projects/constant-q-toolbox/repository/changes/sparse2cell.m">历史记录</a> |
    查看 |
    <a href="/projects/constant-q-toolbox/repository/annotate/sparse2cell.m">追溯</a> |
<a href="/projects/constant-q-toolbox/repository/raw/sparse2cell.m">下载</a>
(979 Bytes)
</p>



  <div class="autoscroll">
<table class="filecontent syntaxhl">
<tbody>
  <tr id="L1">
    <th class="line-num">
      <a href="#L1">1</a>
    </th>
    <td class="line-code">
      <pre>function cellCQT = sparse2cell(spCQT,bins,octaveNr,atomNr,firstcenter,atomHOP)
</pre>
    </td>
  </tr>
  <tr id="L2">
    <th class="line-num">
      <a href="#L2">2</a>
    </th>
    <td class="line-code">
      <pre>% Maps the sparse matrix respresentation of the CQT coefficients back to
</pre>
    </td>
  </tr>
  <tr id="L3">
    <th class="line-num">
      <a href="#L3">3</a>
    </th>
    <td class="line-code">
      <pre>% the cell representation for inverse transform
</pre>
    </td>
  </tr>
  <tr id="L4">
    <th class="line-num">
      <a href="#L4">4</a>
    </th>
    <td class="line-code">
      <pre>%
</pre>
    </td>
  </tr>
  <tr id="L5">
    <th class="line-num">
      <a href="#L5">5</a>
    </th>
    <td class="line-code">
      <pre>%Christian Sch?rkhuber, Anssi Klapuri 2010-06
</pre>
    </td>
  </tr>
  <tr id="L6">
    <th class="line-num">
      <a href="#L6">6</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L7">
    <th class="line-num">
      <a href="#L7">7</a>
    </th>
    <td class="line-code">
      <pre>emptyHops = firstcenter/atomHOP; %void atom hopsizes in the beginning of the temporal kernel
</pre>
    </td>
  </tr>
  <tr id="L8">
    <th class="line-num">
      <a href="#L8">8</a>
    </th>
    <td class="line-code">
      <pre>cellCQT = cell(octaveNr,1);
</pre>
    </td>
  </tr>
  <tr id="L9">
    <th class="line-num">
      <a href="#L9">9</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L10">
    <th class="line-num">
      <a href="#L10">10</a>
    </th>
    <td class="line-code">
      <pre>for i=1:octaveNr
</pre>
    </td>
  </tr>
  <tr id="L11">
    <th class="line-num">
      <a href="#L11">11</a>
    </th>
    <td class="line-code">
      <pre>    dropped = emptyHops*2^(octaveNr-i)-emptyHops;
</pre>
    </td>
  </tr>
  <tr id="L12">
    <th class="line-num">
      <a href="#L12">12</a>
    </th>
    <td class="line-code">
      <pre>    X = full(spCQT(bins*octaveNr-i*bins+1:bins*octaveNr-(i-1)*bins,1:2^(i-1):end));
</pre>
    </td>
  </tr>
  <tr id="L13">
    <th class="line-num">
      <a href="#L13">13</a>
    </th>
    <td class="line-code">
      <pre>    X = [zeros(bins,dropped) X]; 
</pre>
    </td>
  </tr>
  <tr id="L14">
    <th class="line-num">
      <a href="#L14">14</a>
    </th>
    <td class="line-code">
      <pre>    X = [X zeros(bins,ceil(size(X,2)/atomNr)*atomNr-size(X,2))];
</pre>
    </td>
  </tr>
  <tr id="L15">
    <th class="line-num">
      <a href="#L15">15</a>
    </th>
    <td class="line-code">
      <pre>    if atomNr &gt; 1 %reshape
</pre>
    </td>
  </tr>
  <tr id="L16">
    <th class="line-num">
      <a href="#L16">16</a>
    </th>
    <td class="line-code">
      <pre>        Xcell = zeros(bins*atomNr,ceil(size(X,2)/atomNr));    
</pre>
    </td>
  </tr>
  <tr id="L17">
    <th class="line-num">
      <a href="#L17">17</a>
    </th>
    <td class="line-code">
      <pre>        for u=1:bins;  
</pre>
    </td>
  </tr>
  <tr id="L18">
    <th class="line-num">
      <a href="#L18">18</a>
    </th>
    <td class="line-code">
      <pre>            Xbin = reshape(X(u,:),atomNr,length(X(u,:))/atomNr);
</pre>
    </td>
  </tr>
  <tr id="L19">
    <th class="line-num">
      <a href="#L19">19</a>
    </th>
    <td class="line-code">
      <pre>            Xcell((u-1)*atomNr+1:u*atomNr,:) = Xbin;
</pre>
    </td>
  </tr>
  <tr id="L20">
    <th class="line-num">
      <a href="#L20">20</a>
    </th>
    <td class="line-code">
      <pre>        end      
</pre>
    </td>
  </tr>
  <tr id="L21">
    <th class="line-num">
      <a href="#L21">21</a>
    </th>
    <td class="line-code">
      <pre>        cellCQT{i} = Xcell;
</pre>
    </td>
  </tr>
  <tr id="L22">
    <th class="line-num">
      <a href="#L22">22</a>
    </th>
    <td class="line-code">
      <pre>    else
</pre>
    </td>
  </tr>
  <tr id="L23">
    <th class="line-num">
      <a href="#L23">23</a>
    </th>
    <td class="line-code">
      <pre>        cellCQT{i} = full(X);
</pre>
    </td>
  </tr>
  <tr id="L24">
    <th class="line-num">
      <a href="#L24">24</a>
    </th>
    <td class="line-code">
      <pre>    end
</pre>
    </td>
  </tr>
  <tr id="L25">
    <th class="line-num">
      <a href="#L25">25</a>
    </th>
    <td class="line-code">
      <pre>end
</pre>
    </td>
  </tr>
  <tr id="L26">
    <th class="line-num">
      <a href="#L26">26</a>
    </th>
    <td class="line-code">
      <pre>
</pre>
    </td>
  </tr>
  <tr id="L27">
    <th class="line-num">
      <a href="#L27">27</a>
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
