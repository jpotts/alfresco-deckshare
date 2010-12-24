[<#list summary as item>
	<@renderContent item=item />
	<#if item_has_next>,</#if>
</#list>]

<#macro renderContent item>
	{
		"name" : "${item.name}",
		"nodeRef" : "${item.nodeRef.nodeRef}",
		"id" : "${item.id}",
		"description" : "${item.description!!}",
	}
</#macro>
