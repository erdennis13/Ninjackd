require "rails_helper"

feature "User completes subscription" do
	scenario "successfully" do
		add_exercise_to_workout("ExerciseTest", "This is a test exercise description")
		add_subscription

		within "#TestOne_start" do
			click_link "Start workout"
		end

		click_link "mark_all_complete_desktop"

		expect(page).to have_content "Way to go!"

		click_link "workout_history_desktop"

		expect(page).to have_content "Completed workouts"
	end
end