<#if articles??>
    <div class="latest-news">
    	<#if articles.title??>
    		<h3>${articles.title}</h3>
    	</#if>
    	
        <#if articles.assets?size == 0>
            ${msg('list.none')}
        <#else>
    		<ul class="ln-list">
    		  	<#list articles.assets as article>
    		        <li>
    		          <h6><a href="<@makeurl asset=article force='long'/>${linkParam!''}">${article.title!article.name}</a></h6>
    		          <p><@truncate value=article.description chars=100/> <a href="<@makeurl asset=article />">Download</a></p>
    		          <div class="ln-date"><#if article.properties['ws:publishedTime']??>${article.properties['ws:publishedTime']?string(msg('date.format'))}</#if></div>
    		        </li>
    		    </#list>
    		</ul>
    	</#if>
    </div>
</#if>	

