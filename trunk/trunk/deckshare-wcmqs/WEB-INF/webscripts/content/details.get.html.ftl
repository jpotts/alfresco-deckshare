<div class="address-box">
    <h3>${msg(title)}</h3>
    <p>${asset.description!''}</p><br />
    <ul>
        <li><strong>${msg('content.details.author')}</strong>: ${asset.properties['cm:author']!''}</li>
        <li><strong>${msg('content.details.published')}</strong>: <#if asset.properties['cmis:lastModificationDate']??>${asset.properties['cmis:lastModificationDate']?string(msg('date.format'))}</#if></li>
        <li><strong>${msg('content.details.size')}</strong>: ${size}</li>
        <li><strong>${msg('content.details.mimeType')}</strong>: ${asset.properties['cmis:contentStreamMimeType']!''}</li>
        <li><strong>${msg('content.details.download')}</strong>: <a href="<@makeurl asset=asset force='short'/>">${asset.properties['cmis:name']!''}</a></li>
		<#if (categories?size > 0)><li><strong>${msg('content.details.tags')}</strong>:
			<#list categories as tag>
				<#if tag.name != "Carousel"><a href="${url.context}/publications/decks/?id=${tag.id}">${tag.name}</a><#if tag_has_next && categories[tag_index+1].name != "Carousel">,</#if></#if>
            </#list>
		</#if>
    </ul>
</div>    
