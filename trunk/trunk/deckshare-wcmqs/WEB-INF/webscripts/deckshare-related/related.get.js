function main() {

    var connector = remote.connect("alfresco-webscripts");
	var result = connector.get("/deckshare/related/" + asset.getId());
	if(result != null && result != "") {
		var obj = eval('(' + result + ')');
        var relatedAssets = [];
        for (var i = 0; i < obj.length; i++) {
            var relAsset = asset.assetFactory.getAssetById(obj[i]);
            if (relAsset != null) {
                relatedAssets.push(relAsset);
            }
        }
		model.relatedAssets = relatedAssets;

        // If a link page is specified in the component properties then pass this to the view
        if (args.linkPage != null) 
        {
            model.linkParam = '?view='+args.linkPage;
        }
    }

}

main();