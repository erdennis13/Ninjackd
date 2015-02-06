require "rails_helper"

#This feature is for the desktop version
feature "Admin modifies exercises on desktop by" do
	scenario "creating exercise" do

		sign_admin_in

		click_on "Exercises"
		click_link "admin_add_exercise"
		fill_in "Name", with: "TestName"
		fill_in "Description", with: "This is the test description"
		click_button "Submit"

		#Shows up in exercises show page
		expect(page).to have_content "TestName"

		visit exercises_path

		#shows up in exercises index page
		expect(page).to have_css "table tr td", text: "TestName"
		expect(page).to have_css "table tr td", text: "This is the test description"
	end


	scenario "editing exercise" do
		exercise = add_exercise
		sign_admin_in

		visit edit_exercise_path(exercise)

		fill_in "Name", with: "TestExEdit"
		fill_in "Description", with: "Edited test description"
		click_button "Submit"

		visit exercises_path

		expect(page).to have_css "table tr td", text: "TestExEdit"
		expect(page).to have_css "table tr td", text: "Edited test description"
	end

	scenario "destroying exercise" do
		exercise = create(:exercise)
		sign_admin_in
		exercise.destroy!
		visit exercises_path

		expect(page).not_to have_css "table tr td", text: "Test Exercise"
	end

	def add_exercise
		create(:exercise)
	end
end