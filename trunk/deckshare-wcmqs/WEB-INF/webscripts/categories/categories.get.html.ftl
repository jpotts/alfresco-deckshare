<div class="address-box">
<h1>${msg("categories.title")}</h1>

<div id="categoryTree">
<#global depth = 1>

<#if categories??>		
	<#if (categories?size > 0)>
		<ul class="categories-list depth-${depth}">
		<#list categories as category>
			<@renderCat category=category />
		</#list>
		</ul>
	</#if>
</#if>
</div>
</div>

<script type="text/javascript">
//an anonymous function wraps our code to keep our variables
//in function scope rather than in the global namespace:
(function() {
	var tree; //will hold our TreeView instance
	
	function treeInit() {
		
		//YAHOO.log("Example's treeInit function firing.", "info", "example");
		
		//Hand off to a method that randomly generates tree nodes:
		buildTextNodeTree();
		
		//handler for collapsing all nodes
		YAHOO.util.Event.on("collapse", "click", function(e) {
			YAHOO.log("Collapsing all TreeView  nodes.", "info", "example");
			tree.collapseAll();
			YAHOO.util.Event.preventDefault(e);
		});
	}
	
	function buildTextNodeTree() {
	
		//instantiate the tree:
		tree = new YAHOO.widget.TreeView("categoryTree");
		//tree.buildTreeFromMarkup("categoryTree");

		tree.subscribe("labelClick", function(node) {
			//alert("test");
		});
		
		//once it's all built out, we need to render
		//our TreeView instance:
		tree.draw();
		//tree.root.children[2].children[0].focus();
	}
	

	//When the DOM is done loading, we can initialize our TreeView
	//instance:
	YAHOO.util.Event.onDOMReady(treeInit);
	
})();//anonymous function wrapper closed; () notation executes function

</script>



<#macro renderCat category>
	<#if (category.name??)>
	<li class="category-item depth-${depth}<#if category.expanded??> expanded</#if>">
	<a href="${url.context}/publications/decks/?id=${category.id}">${category.name}</a>
		<#if (category.children?size > 0)>
			<#global depth = depth + 1>
			<ul class="categories-list depth-${depth}">
				<#list category.children as subcategory>
					<@renderCat category=subcategory />
				</#list>
			</ul>
			<#global depth = depth - 1>
		</#if>
	</li>
	<#else>
	<li class="category-item depth-${depth}">
		<a href="#">category does not exist (check config file)</a>
	</li>
	</#if>
</#macro>