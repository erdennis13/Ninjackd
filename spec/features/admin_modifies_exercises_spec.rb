require "rails_helper"

#This feature is for the desktop version
feature "Admin modifies exercises by" do
	scenario "creating exercise" do
		sign_admin_in

		click_on "Exercises"
		click_link "admin_add_exercise"
		fill_in "Name", with: "TestName"
		fill_in "Description", with: "This is the test description"
		click_button "Submit"

		expect(page).to have_content "TestName"

		visit exercises_path

		expect(page).to have_css "table tr td", text: "TestName"
		expect(page).to have_css "table tr td", text: "This is the test description"
	end

	scenario "editing exercise" do
		add_exercise
		sign_admin_in

		visit edit_exercise_path(Exercise.last)

		fill_in "Name", with: "TestExEdit"
		fill_in "Description", with: "Edited test description"
		click_button "Submit"

		visit exercises_path

		expect(page).to have_css "table tr td", text: "TestExEdit"
		expect(page).to have_css "table tr td", text: "Edited test description"
	end

	scenario "destroy exercise" do

	end

	def add_exercise
		exercise = Exercise.new(name: "TestEx", description: "Test Description")
		exercise.save!
	end
end