<import resource="classpath:/alfresco/extension/templates/webscripts/org/alfresco/deckshare/related/related.lib.js">

function main() {
    var nodeRef = getNode();
    
    if (nodeRef != null) {
        var relatedDocs = nodeRef.assocs['ds:related'];
        model.results = relatedDocs;
    }
}

main();