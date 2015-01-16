require "rails_helper"

feature "User signs in" do
	scenario "successfully" do
		sign_user_in

		expect(page).to have_css "h1", text: "Welcome to"
	end


	scenario "unsuccessfully" do
		visit new_user_session_path

		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "password"
		click_on "Log in"

		expect(page).to have_content "Invalid email or password"
	end

end

feature "User signs out" do
	scenario "successfully" do
		sign_user_out

		expect(page).to have_content "Signed out successfully."
	end
end