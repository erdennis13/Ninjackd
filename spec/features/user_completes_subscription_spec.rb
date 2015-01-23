require "rails_helper"

feature "User completes subscription" do
	scenario "successfully" do
		add_subscription

		within "#TestOne_start" do
			click_link "Start workout"
		end

		expect(page).to have_content "Make sure you mark your exercises complete as you do them"

		#Need to add exercises to the workout first

		#click_link "mark_all_complete_desktop"

		expect(page).to have_content "Way to go!"
	end
end