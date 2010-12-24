<#if (articles.assets?size > 0)>
<div id="container" style="visibility:hidden;"> 
	<ol id="carousel"> 
		<#list articles.assets as article>
		<li class="item"> 
			<a href="<@makeurl asset=article force='long'/>${linkParam!''}" class="authimg"><img src="<@makeurl asset=article rendition='largeDeckShareThumbnail'/>" alt="${article.title!article.name}" /></a>
	    </li>
        </#list>
	</ol>
</div>
<script>
(function () {
    var carousel;
    YAHOO.util.Event.onDOMReady(function (ev) {
        var carousel = new YAHOO.widget.Carousel("container", {
            animation: { speed: 0.5 }
        });
                       
        carousel.render(); // get ready for rendering the widget
        carousel.show();   // display the widget
		var containerDiv = YAHOO.util.Dom.get("container");
		if (containerDiv != null) {
		    containerDiv.style.visibility = "visible";
		}
    });
})();
</script>
</#if> 
