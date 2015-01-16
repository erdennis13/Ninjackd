require "rails_helper"

feature "User signs in" do
	scenario "successfully" do
		user = User.new(name: "User", username: "Username", admin: false, 
			paypal_payment_token: "Test", email: "user@example.com", password: "password")
		user.save!
		
		visit new_user_session_path
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "password"
		click_button "Log in"

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