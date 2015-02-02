require "rails_helper"

feature "Admin adds warmup" do
	scenario "successfully" do
		sign_admin_in
		visit new_warmup_path

		fill_in "Name", with: "Warmup1"
		fill_in "Description", with: "This is a test warmup"
		click_button "Submit"

		expect(page).to have_content "Warmup was successfully created"
	end

	scenario "and adds to workout, then removes from workout" do
		sign_admin_in
		add_one_workout
		visit new_warmup_path

		fill_in "Name", with: "Warmup1"
		fill_in "Description", with: "This is a test warmup"
		click_button "Submit"

		visit workout_path(Workout.last)

		#expect(page).to have_content "TestOne"

		select "Warmup1", from: "desktop_warmup_select"
		click_button "desktop_add_warmup"

		expect(page).to have_css "h4", text: "This is a test warmup"

		click_link "warmwork_delete_desktop"

		expect(page).not_to have_css "h4", text: "This is a test warmup"

	end
end