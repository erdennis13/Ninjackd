require "rails_helper"

#Desktop version of site
feature "User visits desktop workouts#index" do

	scenario "and sees workouts listed" do
		sign_user_in
		workout = create(:workout)
		visit workouts_path

		expect(page).to have_css "table tr td", text: workout.name
	end

	scenario "and searches for workouts" do
		workout = create(:workout)
		workout2 = create(:workout, name: "Workout2", description: "Test workout 2", category: "Cardio", duration: 45)
		sign_user_in
		visit workouts_path

		#Searches by name
		fill_in "workouts_search_field", with: workout.name
		click_button "filter_button"

		expect(page).to have_css "table tr td", text: workout.name
		expect(page).not_to have_css "table tr td", text: workout2.name

		#Resets Filter
		click_button "reset_filter"

		expect(page).to have_css "table tr td", text: workout.name
		expect(page).to have_css "table tr td", text: workout2.name

		#searches by category
		select workout2.category, from: "workouts_category_field"
		click_button "filter_button"

		expect(page).not_to have_css "table tr td", text: workout.name
		expect(page).to have_css "table tr td", text: workout2.name

		#searches by duration
		click_button "reset_filter"
		fill_in "duration_search_field", with: workout2.duration
		click_button "filter_button"

		expect(page).not_to have_css "table tr td", text: workout.name
		expect(page).to have_css "table tr td", text: workout2.name
	end

	scenario "and there are no workouts" do
		sign_user_in
		visit workouts_path

		expect(page).to have_css "h2", text: "Sorry, no workouts matched these filters. Please try something else"
	end

end

#this is for the mobile version
feature "User visits mobile workouts#index" do

	scenario "and sees workouts listed" do
		sign_user_in
		workout = create(:workout)
		visit workouts_path

		expect(page).to have_css "h4", text: workout.name
	end

	scenario "and searches for workouts" do
		workout = create(:workout)
		workout2 = create(:workout, name: "Workout2", description: "Test workout 2", category: "Cardio", duration: 45)
		sign_user_in
		visit workouts_path

		#Searches by name
		fill_in "mobile_workouts_search_field", with: workout.name
		click_button "mobile_filter_button"

		expect(page).to have_css "h4", text: workout.name
		expect(page).not_to have_css "h4", text: workout2.name

		#Resets Filter
		click_button "mobile_reset_filter"

		expect(page).to have_css "h4", text: workout.name
		expect(page).to have_css "h4", text: workout2.name

		#searches by category
		select workout2.category, from: "mobile_workouts_category_field"
		click_button "mobile_filter_button"

		expect(page).not_to have_css "h4", text: workout.name
		expect(page).to have_css "h4", text: workout2.name

		#searches by duration
		click_button "mobile_reset_filter"
		fill_in "mobile_duration_search_field", with: workout2.duration
		click_button "mobile_filter_button"

		expect(page).not_to have_css "h4", text: workout.description
		expect(page).to have_css "h4", text: workout2.description
	end

end