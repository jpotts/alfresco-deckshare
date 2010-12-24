<#if articles??>
    <#if articles.title??>
		<script>document.title += " Category: ${articles.title}";</script>
        <div class="interior-header">
            <h2 class="full-h">${articles.title}</h2>
            <#if articles.description??><p class="intheader-paragraph">${articles.description}</p></#if>
        </div>
    </#if>
    
    <div class="interior-content">
        <#if articles.assets?size == 0>
            ${msg('list.none')}
        <#else>
            <ul class="publications-list">
                <#list articles.assets as article>      
                    <li class="entry">
                        <a href="${url.context}/publications/decks/${article.name}${linkParam!''}"><img src="${url.context}/asset/${article.id}/${article.name}?rendition=mediumDeckShareThumbnail" alt="${article.title!''}" class="img-border"/></a>                        
                        <div class="publications-list-detail">
                            <h3><a href="${url.context}/publications/decks/${article.name}${linkParam!''}">${article.title!article.name}</a></h3>
                            <span class="newslist-date">
                                <#if article.lastModificationDate??>${article.lastModificationDate}</#if>
                                <#if article.author??> by ${article.author}</#if>
                            </span>
                            <p>${article.description!'no preview'} <a href="${url.context}/asset/${article.id}/${article.name}${linkParam!''}">Download</a></p>
                        
                            <#if article.tags?size == 0>
                            <#else>
                            <h3>${msg('tags')}</h3>
                                <ul class="tag-list">
                                    <#list article.tags as tag>
                                        <li>${tag.name}</li>
                                    </#list>
                                </ul>
                            </#if>
                            <h3>${msg('categories')}</h3>
                            <#if article.categories?size == 0>
                                <p class="tag-list">${msg('tags.none')}</p>
                            <#else>
                                <ul class="tag-list">
                                    <#list article.categories as tag>
                                        <#if tag.name != "Carousel"><li><a href="${url.context}/publications/decks/?id=${tag.id}">${tag.name}</a></li></#if>
                                    </#list>
                                </ul>
                            </#if>
                        </div>
                    </li>
                </#list>
            </ul>
        </#if>
    </div>
</#if>