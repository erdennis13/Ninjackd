require "rails_helper"

feature "Admin adds exercise to workout" do
	scenario "successfully" do
		sign_admin_in
		workout = create(:workout)
		#add_one_exercise("ExerciseTest", "This is a test exercise description.")
		exercise = create(:exercise)

		visit workouts_path
		within "#workouts_table" do
			click_link workout.name
		end

		select exercise.name, from: "add_exercise_desktop"
		fill_in "sets_desktop", with: 5
		fill_in "reps_desktop", with: 10
		fill_in "rest_time_desktop", with: 120
		click_button "add_exercise_button_desktop"

		expect(page).to have_css "table tr td", text: exercise.name

	end

	scenario "also successfully" do
		exercise = create(:exercise)
		workout = create(:workout)
		add_exercise_to_workout(exercise, workout)
		sign_user_in
		
		visit workouts_path
		within "#workouts_table" do
			click_link workout.name
		end

		expect(page).to have_css "table tr td", text: exercise.name
	end
end