function getNode() {
	var nodeRefString = url.templateArgs.nodeRef;
    
    var nodeRef;
    if (nodeRefString != null && nodeRefString != "") {
        nodeRef = search.findNode(nodeRefString);
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
    
    return nodeRef;
}