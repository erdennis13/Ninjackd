require "rails_helper"

feature "Admin adds exercise to workout" do
	scenario "successfully" do
		sign_admin_in
		add_one_workout
		add_one_exercise("ExerciseTest", "This is a test exercise description.")

		visit workouts_path
		within "#workouts_table" do
			click_link "TestOne"
		end

		select "ExerciseTest", from: "add_exercise_desktop"
		fill_in "sets_desktop", with: 5
		fill_in "reps_desktop", with: 10
		fill_in "rest_time_desktop", with: 120
		click_button "add_exercise_button_desktop"

		expect(page).to have_css "table tr td", text: "ExerciseTest"

	end

	scenario "also successfully" do
		add_exercise_to_workout("ExerciseTest", "This is a test exercise description")
		sign_user_in
		
		visit workouts_path
		within "#workouts_table" do
			click_link "TestOne"
		end

		expect(page).to have_css "table tr td", text: "ExerciseTest"
	end
end