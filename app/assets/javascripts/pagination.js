$(function() {
	$(document).delegate(".pagination a", "click", function() {
		$(".pagination").html("Page is loading...")
		$.get(this.href, null, null, "script");
		history.pushState(null, document.title, this.href )
		return false;
	});
	$(window).bind("popstate", function() {
		$.getScript(location.href);
	});
})