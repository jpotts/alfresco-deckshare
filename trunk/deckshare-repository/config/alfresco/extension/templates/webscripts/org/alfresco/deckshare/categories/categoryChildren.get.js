function main() {
	// node can be either a nodeRef or a QName
	var nodeRefString = url.templateArgs.nodeRef;
	var nodePathString = url.templateArgs.nodePath;
    
    var nodeRef;
    if (nodeRefString != null && nodeRefString != "") {
        nodeRef = search.findNode(nodeRefString);
 	} else if (nodePathString != null && nodePathString != "") {
    	if(nodePathString.charAt(0) == "/") {
       		nodeRef = search.luceneSearch("QNAME: \""+nodePathString.substr(1)+"\"");
    	} else {
       		nodeRef = search.luceneSearch("QNAME: \""+nodePathString+"\"");
       	}
       	nodeRef = nodeRef[0];
    } else {
        status.setCode(status.STATUS_BAD_REQUEST);
        status.setRedirect(true);
        return;
    }
    
    if (nodeRef == null) {
        status.setCode(status.STATUS_NOT_FOUND);
        status.setRedirect(true);
        return;
    }

	var cat = new Category(nodeRef, getSubCategories(nodeRef));
    model.results = cat;
}

function Category(categoryNodeRef, categoryChildren) {
    this.nodeRef = categoryNodeRef;
    this.children = categoryChildren;
}

function getSubCategories(categoryNode) {
    var subCatList = new Array();

	if(categoryNode.childAssocs != null) {
	    var subCats = categoryNode.childAssocs['cm:subcategories'];
    	if (subCats == null || subCats.length <= 0) {
        	return subCatList;
    	}
	    for (var i = 0; i < subCats.length; i++) {
    	    subCatList.push(new Category(subCats[i], getSubCategories(subCats[i])));
    	}
    }
    return subCatList;
}

main();