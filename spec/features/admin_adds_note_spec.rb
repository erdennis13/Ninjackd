require "rails_helper"

feature "Admin adds note" do
	scenario "successfully" do
		sign_admin_in
		workout = create(:workout, note: nil)
		visit workout_path workout

		fill_in "note_field_desktop", with: "Testing note capability"
		click_button "note_button_desktop"

		expect(page).to have_content "Testing note capability"
	end
end