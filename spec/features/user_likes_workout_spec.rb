require "rails_helper"

feature "User likes workout" do
	scenario "successfully" do
		sign_user_in
		workout = create(:workout)
		visit workout_path workout

		click_button "like_desktop"

		expect(page).to have_content "Like was successfully created."
	end

	scenario "and unlikes workout" do
		sign_user_in
		workout = create(:workout)
		visit workout_path workout

		click_button "like_desktop"

		click_on "unlike_desktop"

		expect(page).to have_content "You have unliked this workout"		
	end
end