require "rails_helper"

feature "Unauth page loads sign in form" do
	scenario "then signs in" do
		@user = create(:user)
		visit workouts_path

		fill_in "pleasesignin_email", with: @user.email
		fill_in "pleasesignin_password", with: @user.password
		click_on "pleasesignin_button"

		visit workouts_path

		expect(page).to have_css "h1", text: "Workouts"
	end
end