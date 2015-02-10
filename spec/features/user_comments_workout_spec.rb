require "rails_helper"

feature "User visits workout page" do
	before(:each) do
		workout = create(:workout)
		sign_user_in
		visit workout_path(workout)
	end

	scenario "and makes comment" do
		fill_in "comment_field_desktop", with: "This is a test comment"
		click_button "comment_button_desktop"

		expect(page).to have_css "h5", text: "This is a test comment"
	end

	scenario "hits comment with empty field" do

		click_button "comment_button_desktop"

		expect(page).to have_content "Comment was unsuccessfully created."
	end
end