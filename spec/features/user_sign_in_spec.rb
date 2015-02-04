require "rails_helper"

feature "User signs in" do
	scenario "successfully" do
		sign_user_in

		expect(page).to have_css "h1", text: "Welcome to"
	end


	scenario "unsuccessfully" do
		visit new_user_session_path

		fill_in "email_sign_in", with: "user@example.com"
		fill_in "password_sign_in", with: "password"
		click_on "Log in"

		expect(page).to have_content "Invalid email or password"
	end

	scenario "using navbar form" do
		User.create(name: "User", username: "Username", admin: false, paypal_payment_token: "Test", 
			email: "user@example.com", password: "password")

		visit root_path

		fill_in "navbar_email", with: "user@example.com"
		fill_in "navbar_password", with: "password"
		click_button "navbar_signin"

		expect(page).to have_content "Signed in successfully."
	end

end

feature "User signs out" do
	scenario "successfully" do
		sign_user_out

		expect(page).to have_content "Signed out successfully."
	end
end