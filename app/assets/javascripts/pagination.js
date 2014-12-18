$(function() {
	$(document).on("click", "#homepage .pagination a", function() {
		//$(".pagination").show("#loading-icon")
		$.get(this.href, null, null, "script")
		$(".pagination").hide("#loading-icon");
		//history.pushState(null, document.title, this.href )
		return false;
	});
	$(document).on("click", "#showpage .pagination a", function() {
		$(".pagination").html()
		$.get(this.href , null, null, "script")
		$(".pagination").hide("#loading-icon");;
		return false;
	});
	$(window).bind("popstate", function() {
		$.getScript(location.href);
	});
	$('#loading-icon').hide();  // hide it initially.
  $(document)  
    .ajaxStart(function() {
      $('#loading-icon').show(); // show on any Ajax event.
    })
    .ajaxStop(function() {
      $('#loading-icon').hide(); // hide it when it is done.
  });
});
