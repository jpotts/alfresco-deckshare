[<#list categories as cat>
	<@renderCat cat=cat />
	<#if cat_has_next>,</#if>
</#list>]

<#macro renderCat cat>
	{
	"name" : "${cat.name}",
	"id" : "${cat.nodeRef.id}"
	}
</#macro>