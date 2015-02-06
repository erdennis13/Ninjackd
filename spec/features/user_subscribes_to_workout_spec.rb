require "rails_helper"

#This is only for the Desktop version
feature "User subscribes to workout" do
	scenario "successfully" do
		sign_user_in
		create(:workout)
		visit workouts_path

		within "#workouts_table" do
			click_link "TestWorkout"
		end

		fill_in "date_picker_desktop", with: Date.today
		click_button "subscribe_button_desktop"

		expect(page).to have_content "Subscription was successfully created"
	end

end