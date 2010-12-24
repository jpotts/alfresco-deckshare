<#macro templateBody>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "/common/head.ftl"/> 
    <#include "/common/title.ftl"/>

	<!-- Custom CSS styles -->
	<link rel="stylesheet" type="text/css" href="${url.context}/css/deckshare.css" />
	<link rel="stylesheet" type="text/css" href="${url.context}/css/deckview.css" />
    
</head>
<body class="yui-skin-sam">
<div id="body-wrapper">
    <div class="clearfix">
        <div id="logo"> 
            <a href="${url.context}/">${webSite.description!}</a>
            <#if webSite.title??><p class="logo-desc">${webSite.title}</p></#if>
        </div>
        <div class="link-menu">
            <ul>                
                <!--<li><a href="#">${msg('links.accessibility')}</a></li>-->
                <li><a href="${url.context}/about/about.html">${msg('links.about')}</a></li>
            </ul>
        </div>
        <@region id="top-right" scope="template"/>  
    </div>
  
    <div class="main-menu-wrapper">
        <@region id="menu" scope="global"/>
    </div>
  
    <#nested>
     
    <div id="footer">
		<div class="copyright-left">
			<a href="http://www.metaversant.com" class="footer_img"><img src="${url.context}/metaversant_logo.png" alt="Metaversant"</img></a>
			<a href="http://www.tribloom.com" class="footer_img"><img src="${url.context}/tribloom_logo.png" alt="Tribloom"</img></a>
		</div>
        <div class="copyright"><a href="http://wiki.alfresco.com/wiki/Web_Quick_Start_Developer_Guide">Built with WCM Quick Start</a></div>
    </div>
</div>

<#include "/common/init.ftl"/> 
</body>
</html>
</#macro>
