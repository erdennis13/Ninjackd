require "rails_helper"

#This feature is for the desktop version.
feature "User visits desktop exercises page" do
	scenario "and sees exercise list" do
		sign_user_in
		visit exercises_path
		expect(page).to have_css "table th", text: "Description"
	end

	scenario "and searches for exercise" do
		sign_user_in
		exercise = create(:exercise)
		exercise2 = create(:exercise, name: "TestTwo", description: "Test description for two")

		visit exercises_path

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).to have_css "table tr td", text: "TestTwo"

		fill_in "search_field", with: "Test Exercise"
		click_on "filter_button"

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).not_to have_css "table tr td", text: "TestTwo"

		click_on "reset_filter_button"

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).to have_css "table tr td", text: "TestTwo"

		fill_in "description_field_desktop", with: "This is a test exercise description"
		click_on "filter_button"

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).not_to have_css "table tr td", text: "TestTwo"
	end
end

#This feature will be for the mobile version.
feature "User visits mobile exercises page" do
	scenario "and sees exercise list" do
		sign_user_in
		visit exercises_path
		expect(page).to have_css "table th", text: "Description"
	end

	scenario "and searches for exercise" do
		sign_user_in
		exercise = create(:exercise)
		exercise2 = create(:exercise, name: "TestTwo", description: "Test description for two")
		visit exercises_path

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).to have_css "table tr td", text: "TestTwo"

		fill_in "search_mobile_field", with: "Test Exercise"
		click_on "filter_mobile_button"

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).not_to have_css "table tr td", text: "TestTwo"

		click_on "reset_mobile_filter_button"

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).to have_css "table tr td", text: "TestTwo"

		fill_in "description_field_mobile", with: "This is a test exercise description"
		click_on "filter_mobile_button"

		expect(page).to have_css "table tr td", text: "Test Exercise"
		expect(page).not_to have_css "table tr td", text: "TestTwo"
	end

end