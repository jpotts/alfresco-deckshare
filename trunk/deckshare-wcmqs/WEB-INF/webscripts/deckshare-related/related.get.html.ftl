<#if relatedAssets?? && (relatedAssets?size > 0)>
	<h3>Related:</h3>
    <div class="interior-content">
		<ul class="newslist-wrapper">
			<#list relatedAssets as article>  	
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
    </div>
</#if>