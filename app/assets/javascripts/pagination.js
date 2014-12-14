$(function() {
//	$("#homepage").delegate(".pagination a", "click", function() {
	$(document).on("click", "#homepage .pagination a", function() {
		$(".pagination").html("Page is loading...")
		$.get(this.href, null, null, "script");
		history.pushState(null, document.title, this.href )
		return false;
	});
	$(document).on("click", "#showpage .pagination a", function() {
		$(".pagination").html("Whats up motherfucker...")
		$.get(this.href , null, null, "script");
		return false;
	});
	$(window).bind("popstate", function() {
		$.getScript(location.href);
	});
});
