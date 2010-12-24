function main() {
	var connector = remote.connect("alfresco-webscripts");
	var arg = url.args["id"]
	var nodeId = arg;
	var result = connector.get("/deckshare/list/"+nodeId);
	if(result != null && result != "") {
		var obj = eval('(' + result + ')');
		model.articles = obj;
	}
}

function main2() {
model.articles = collectionService.getCollection(context.properties.section.id, args.collection);
}
//If a link page is specified in the component properties then pass this to the view
if (args.linkPage != null) 
{
	model.linkParam = '?view='+args.linkPage;
}

main();
