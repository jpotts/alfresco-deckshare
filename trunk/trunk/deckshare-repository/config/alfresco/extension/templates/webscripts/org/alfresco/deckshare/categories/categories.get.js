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
    
    model.categories = nodeRef.properties["cm:categories"] != null ? nodeRef.properties["cm:categories"] : new Array();

}

main();
