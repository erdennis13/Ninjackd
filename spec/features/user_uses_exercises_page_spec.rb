require "rails_helper"


#This feature is for the desktop version.
feature "User visits exercises page" do
	scenario "and sees exercise list" do
		visit_exercises_page
		expect(page).to have_css "table th", text: "Description"
	end

	scenario "and searches for exercise" do
		exercise = Exercise.new(name: "TestEx", description: "Test Description")
		exercise2 = Exercise.new(name: "TestTwo", description: "Second Description")
		exercise.save!
		exercise2.save!
		visit_exercises_page

		expect(page).to have_css "table tr td", text: "TestEx"
		expect(page).to have_css "table tr td", text: "TestTwo"

		fill_in "search_field", with: "TestEx"
		click_on "filter_button"

		expect(page).to have_css "table tr td", text: "TestEx"
		expect(page).not_to have_css "table tr td", text: "TestTwo"

		click_on "reset_filter_button"

		expect(page).to have_css "table tr td", text: "TestEx"
		expect(page).to have_css "table tr td", text: "TestTwo"
	end

	def visit_exercises_page
		sign_user_in
		click_on "Exercises"
	end
end

#This feature will be for the mobile version.