<#escape x as jsonUtils.encodeJSONString(x)>
{
	"title" : "${title?html}",
	"description" : "${description?html}",
	"assets" : 
[<#list articles as article>
	<@renderArticle article=article />
	<#if article_has_next>,</#if>
</#list>]
}
</#escape>

<#macro renderArticle article>
	{
		"title" : "${article.node.properties.title?html}",
		"name" : "${article.node.name?html}",
		"id" : "${article.node.id}",
		"description" : "${article.node.properties.description?html}",
		"lastModificationDate" : "${article.node.properties.modified?datetime}",
		"author" : "${article.node.properties.creator}",
		"tags" : 
[<#list article.tags as tag>
	<@renderTag tag=tag />
	<#if tag_has_next>,</#if>
</#list>],
		"categories" : 
[<#list article.categories as cat>
	<@renderTag tag=cat />
	<#if cat_has_next>,</#if>
</#list>]
	}
</#macro>

<#macro renderProp prop>
	{
	}
</#macro>

<#macro renderTag tag>
	{
	"name" : "${tag.name}",
	"id" : "${tag.nodeRef.id}"
	}
</#macro>
