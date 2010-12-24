function main() {

    var connector = remote.connect("alfresco-webscripts");
	var result = connector.get("/deckshare/supporting/" + asset.getId());
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
	}
}

main();