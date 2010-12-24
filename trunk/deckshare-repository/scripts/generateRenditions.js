var renditions = ["ws:mediumDeckShareThumbnail", "ws:largeDeckShareThumbnail"];

for (var i = 0; i < space.children.length; i++) {
    for (var j = 0; j < renditions.length; j++) {
        if (space.children[i].name == "index.html") {
            continue;
        } else {
            renditionService.render(space.children[i], renditions[j]);
        }
    }
}