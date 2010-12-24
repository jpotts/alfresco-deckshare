<div class="interior-content">
    <h2>${asset.title!'no title'}</h2>
    <div class="blog-list-misc">
        <#if asset.properties['cmis:lastModificationDate']??><span>${asset.properties['cmis:lastModificationDate']?string(msg('date.format'))}</span></#if>
    </div>
 
    <#if asset.mimeType?starts_with("image/")>
        <img src="<@makeurl asset=asset rendition="imagePreview"/>" alt="${asset.title!''}" class="web-preview-image"/>
    <#else>
        <div id="web-preview-container" class="web-preview-empty">
            <div id="web-preview"><#if (asset?exists)>${msg("label.preparingPreviewer")}</#if></div>
        </div>
    
        <#if (asset?exists)>
            <script type="text/javascript">//<![CDATA[
            WebPreview.render("${url.context}",
                              "${args.htmlid}",                          
                              "<@makeurl asset=asset rendition='swfPreview'/>",
                              "${asset.name?js_string}",
                              ${messages});
            //]]></script>
        </#if>
    </#if>
</div>