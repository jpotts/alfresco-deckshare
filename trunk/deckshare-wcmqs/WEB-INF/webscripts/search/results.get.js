model.pageNumber = results.query.resultsToSkip / results.query.maxResults + 1;
model.totalPages = Math.ceil(results.totalSize / results.query.maxResults); 
model.prevSkip = results.query.resultsToSkip - results.query.maxResults;
model.nextSkip = results.query.resultsToSkip + results.query.maxResults;

// If a link page is specified in the component properties then pass this to the view
if (args.linkPage != null) 
{
	model.linkParam = '?view='+args.linkPage;
}