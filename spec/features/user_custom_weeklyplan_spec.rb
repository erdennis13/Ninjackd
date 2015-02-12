require "rails_helper"

feature "User creates custom weeklyplan" do
	scenario "successfully" do
		workout = create(:workout)

		sign_user_in
		visit workouts_path

		click_button "create_custom_weeklyplan_desktop"

		expect(page).to have_content "Weeklyplan was successfully created."

		# Now needs to add workouts to this weeklyplan
		select workout.name, from: "2_workout_select"
		click_button "2_add_weeklybit"

		select workout.name, from: "4_workout_select"
		click_button "4_add_weeklybit"

		expect(page).to have_css "h3", text: workout.name

		fill_in "update_weeklyplan_name", with: "Testing custom names"
		click_button "update_name_button"

		expect(page).to have_css "h1", text: "Testing custom names"

		# Returns to workouts_path and subscribes to this weeklyplan
		click_link "return_to_weeklyplans"

		click_on "Testing custom names_subscribe"

		expect(page).to have_content "Weeklyplan was added successfully to your subscriptions. Enjoy!"
	end
end