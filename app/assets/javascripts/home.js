$(document).ready(function() {
	$('#homepageweeklyplans').hide();
	$('#home_workout_view').addClass("btn-primary");
	$('#home_weeklyplan_view').addClass('btn-default');

	$("#home_workout_view").on('click', function() {
		$('#homepageweeklyplans').hide();
		$('#homepageworkouts').show();
		$('#home_workout_view').addClass("btn-primary");
		$('#home_weeklyplan_view').addClass('btn-default');
		$('#home_weeklyplan_view').removeClass("btn-primary");
	});

	$("#home_weeklyplan_view").on('click', function() {
		$('#homepageworkouts').hide();
		$('#homepageweeklyplans').show();
		$('#home_workout_view').removeClass("btn-primary");
		$('#home_workout_view').addClass("btn-default");
		$('#home_weeklyplan_view').addClass('btn-primary');
	});
});

$(document).ready(function() {
	$('#homepageweeklyplans_sm').hide();
	$('#home_workout_view_sm').addClass("btn-primary");
	$('#home_weeklyplan_view_sm').addClass('btn-default');

	$("#home_workout_view_sm").on('click', function() {
		$('#homepageweeklyplans_sm').hide();
		$('#homepageworkouts_sm').show();
		$('#home_workout_view_sm').addClass("btn-primary");
		$('#home_weeklyplan_view_sm').addClass('btn-default');
		$('#home_weeklyplan_view_sm').removeClass("btn-primary");
	});

	$("#home_weeklyplan_view_sm").on('click', function() {
		$('#homepageworkouts_sm').hide();
		$('#homepageweeklyplans_sm').show();
		$('#home_workout_view_sm').removeClass("btn-primary");
		$('#home_workout_view_sm').addClass("btn-default");
		$('#home_weeklyplan_view_sm').addClass('btn-primary');
	});
});