function main() {
	var node = findFromReference();
	
//	var luceneQuery = " +PATH:\""+ node.qnamePath +"/member\""; // direct members
	var luceneQuery = " +PATH:\""+ node.qnamePath +"//member\""; // direct members and subcategory members

	var members = search.luceneSearch(luceneQuery);
	
	//var articles = new Articles("test title", "test description", members);
	model.title = node.name;
	model.description = node.properties["cm:description"];
	
	var results = [];
	for(var i = 0; i < members.length; i++) {
//		members[i].bob = members[i].properties["cm:categories"];
		results.push(new Member(members[i]));
	}
	model.articles = results;
}

function Member(node) {
	this.node = node;
	this.tags = node.properties["cm:taggable"] != null ? node.properties["cm:taggable"] : new Array();
	this.categories = node.properties["cm:categories"] != null ? node.properties["cm:categories"] : new Array();
}

function findFromReference() {
	var nodeRef = "workspace://SpacesStore/" + url.templateArgs.category,
		node = null;

	node = search.findNode(nodeRef);

	if (node === null) { 
		status.setCode(status.STATUS_NOT_FOUND, "Node " + nodeRef + " does not exist");
	}
	return node;
}

function Articles(articlesTitle, articlesDescription, articles) {
    this.title = articlesTitle;
    this.description = articlesDescription;
    this.assets = articles;
}

main();
