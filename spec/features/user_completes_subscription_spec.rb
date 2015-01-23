require "rails_helper"

feature "User completes subscription" do
	scenario "successfully" do
		add_subscription

		within "#TestOne_start" do
			click_link "Start workout"
		end

		expect(page).to have_content "Make sure you mark your exercises complete as you do them"
	end
end