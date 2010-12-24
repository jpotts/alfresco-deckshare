/**
 * This script will search for the content of a particular category
 * in the DeckShare folder.
 */
function main() {
	var category = (url.templateArgs.category !== null) ? url.templateArgs.category : "";

	var summaryList = new Array();

	// TODO? Make the path configurable in a config file?
	var query = "PATH:\"/cm:categoryRoot/cm:generalclassifiable/cm:DeckShare/"+ (category==""?"":("/cm:" + search.ISO9075Encode(category)+"/") )+ "member\"";
	var results = search.luceneSearch(query);

	for(var i = 0; i < results.length; i++) {
	//if (results == null || results.length <= 0) {
		// noop
	//} else {
		var item = new Summary(results[i].nodeRef, results[i].id, results[i].name, results[i].properties["cm:description"]);
		summaryList.push(item);
	}
    model.summary = summaryList;
}

function Summary(contentNodeRef, contentId, contentName, contentDescription) {
    this.nodeRef = contentNodeRef;
    this.id = contentId;
    this.name = contentName;
    this.description = contentDescription;
}

main();
