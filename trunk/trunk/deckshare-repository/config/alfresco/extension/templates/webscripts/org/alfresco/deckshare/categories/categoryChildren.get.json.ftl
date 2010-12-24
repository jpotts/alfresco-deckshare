<@renderCat cat=results />

<#macro renderCat cat>{
	"name" : "${cat.nodeRef.name}",
	"nodeRef" : "${cat.nodeRef.nodeRef}",
	"id" : "${cat.nodeRef.id}",
	"description" : "${cat.nodeRef.description!!}",
	"children" : [<#list cat.children as subCat> <@renderCat cat=subCat /><#if subCat_has_next>,</#if></#list>]
}</#macro>
