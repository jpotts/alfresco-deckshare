<#if articles??>
    <#if articles.title??>
    	<div class="clearfix">
    	    <h2>${articles.title}</h2>
    	    <#if articles.description??><p class="header-desc">${articles.description}</p></#if>
    	</div>
    </#if>
    
    <div class="interior-content">
        <#if articles.assets?size == 0>
            ${msg('list.none')}
        <#else>
    		<ul class="newslist-wrapper">
    		  	<#list articles.assets as article>  	
    		        <li>
                        <#if article.relatedAssets['ws:primaryImage']??>             
                            <#assign image=article.relatedAssets['ws:primaryImage'][0]>             
                            <a href="<@makeurl asset=article force='long'/>${linkParam!''}"><img src="<@makeurl asset=image rendition='smallThumbnail'/>" alt="${image.title!article.title!article.name}" class="news-img" /></a>
						<#else>
							<a href="<@makeurl asset=article force='long'/>${linkParam!''}"><img src="<@makeurl asset=article rendition='mediumDeckShareThumbnail'/>" alt="${article.title!''}" class="news-img"/></a>						
                        </#if>
    		            <h4><a href="<@makeurl asset=article force='long'/>${linkParam!''}">${article.title!article.name}</a></h4>
    		            <span class="newslist-date"><#if article.properties['ws:publishedTime']??>${article.properties['ws:publishedTime']?string(msg('date.format'))}</#if></span>
    		            <p>${article.description!''} <a href="<@makeurl asset=article />">Download</a></p>
    		        </li>
    		    </#list>
    		</ul>
    	</#if>
    </div>
</#if>	

