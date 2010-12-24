<#if (articles.assets?size > 0)>
    <script type="text/javascript" src="${url.context}/js/slideswitch.js"></script>
    <div id="slideshow-wrapper">
        <ul id="slideshow">
            <#list articles.assets as article>
                <li <#if article_index == 1>class="active"</#if>>                     
                    <a href="<@makeurl asset=article force='long'/>${linkParam!''}"><img src="<@makeurl asset=article rendition='featuredNewsThumbnail'/>" alt="${article.title!article.name}" class="slide-1-img" /></a>
                    <div class="slide-1-desc">
                      <h1>${article.title!article.name}</h1>
                      <p>${article.description!''}</p>
                      <div class="slideshow-rm"><a href="<@makeurl asset=article force='long'/>${linkParam!''}">${msg('read.more')}</a></div>
                    </div>
                </li>
            </#list>
        </ul>
    </div>
</#if> 
