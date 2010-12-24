<#if relatedAssets?? && (relatedAssets?size > 0)>
	<div class="address-box">
    <ul>
        <li><strong>${msg('content.details.supporting')}</strong>:
		<#list relatedAssets as file>
		    <a href="<@makeurl asset=file />">${file.name}</a><#if file_has_next>,</#if>
		</#list>
		</li>
	</ul>
	</div>
</#if>