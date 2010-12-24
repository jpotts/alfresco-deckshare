function main() {
	var catConfig = new XML(config.script);
	var xmlCategories = catConfig;
	var categories = [];
	for each (var cat in xmlCategories.category) {
		categories.push( cat.@path ); 
	}

	var arg = url.args["id"]
   	var nodeId = arg;

	var connector = remote.connect("alfresco-webscripts");
	var results = [];
	for(var i = 0; i < categories.length; i++) {
		var result = connector.get("/deckshare/categoryChildren/path/"+categories[i]);
		if(result != null && result != "") {
			var obj = eval('(' + result + ')');
			//for(var j = 0; j < obj.children.length; j++) {
				if(childSelected(obj, nodeId)) {
					//obj.expanded = "true";
				}
			//}
			results.push(obj);
		}
	}
	
	model.categories = results;
}

function childSelected(node, nodeId) {
	if(node.id == nodeId) {
		//node.expanded = "true";
		return true;
	}
	for(var i = 0; i < node.children.length; i++) {
		if(childSelected(node.children[i], nodeId)) {
			node.expanded = "true";
			return true;
		}
	}
	return false;
}

function getSubCategories(categoryNode) {
    var subCatList = new Array();

    var subCats = categoryNode.children;
    if (subCats == null || subCats.length <= 0) {
        return subCatList;
    }
    for (var i = 0; i < subCats.length; i++) {
        //subCatList.push(asset.assetFactory.getAssetById(subCats[i].nodeRef));
    }
    return subCatList;
}

main();