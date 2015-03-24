$(document).ready(function() {
	$('#sign_in_form').hide();
	$('#sign_in_label').hide();
	$('#show_login_form').on('click', function() {
		$('#sign_in_form').show();
		$('#ninja_pic').hide();
		$('#show_login_form').hide();
		$('#sign_up_button').hide();
		$('#please_sign_in').hide();
		$('#sign_in_label').show();
	});
});