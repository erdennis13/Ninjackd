require "rails_helper"

#Desktop version of site
feature "User visits desktop workouts#index" do

	scenario "and sees workouts listed" do
		sign_user_in
		add_one_workout
		visit workouts_path

		expect(page).to have_css "table tr td", text: "Test strength workout"
	end

	scenario "and searches for workouts" do
		add_two_workouts
		sign_user_in
		visit workouts_path

		#Searches by name
		fill_in "workouts_search_field", with: "TestOne"
		click_button "filter_button"

		expect(page).to have_css "table tr td", text: "TestOne"
		expect(page).not_to have_css "table tr td", text: "TestTwo"

		#Resets Filter
		click_button "reset_filter"

		expect(page).to have_css "table tr td", text: "TestOne"
		expect(page).to have_css "table tr td", text: "TestTwo"

		#searches by category
		select "Cardio", from: "workouts_category_field"
		click_button "filter_button"

		expect(page).not_to have_css "table tr td", text: "TestOne"
		expect(page).to have_css "table tr td", text: "TestTwo"

		#searches by duration
		click_button "reset_filter"
		fill_in "duration_search_field", with: 45
		click_button "filter_button"

		expect(page).not_to have_css "table tr td", text: "TestOne"
		expect(page).to have_css "table tr td", text: "TestTwo"
	end

	scenario "and there are no workouts" do
		sign_user_in
		visit workouts_path

		expect(page).to have_css "h2", text: "Sorry, no workouts matched these filters. Please try something else"
	end

	def add_one_workout
		w1 = Workout.new(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
		w1.save!
	end

	def add_two_workouts
		w1 = Workout.new(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
		w2 = Workout.new(name: "TestTwo", category: "Cardio", description: "Test cardio workout", 
			duration: 45, weightFacility: nil, active: true, note: "Testing note for TestTwo")
		w1.save!
		w2.save!
	end
end

#this is for the mobile version
feature "User visits mobile workouts#index" do

	scenario "and sees workouts listed" do
		sign_user_in
		add_one_workout
		visit workouts_path

		expect(page).to have_css "h4", text: "Test strength workout"
	end

	scenario "and searches for workouts" do
		add_two_workouts
		sign_user_in
		visit workouts_path

		#Searches by name
		fill_in "mobile_workouts_search_field", with: "TestOne"
		click_button "mobile_filter_button"

		expect(page).to have_css "h4", text: "TestOne"
		expect(page).not_to have_css "h4", text: "TestTwo"

		#Resets Filter
		click_button "mobile_reset_filter"

		expect(page).to have_css "h4", text: "TestOne"
		expect(page).to have_css "h4", text: "TestTwo"

		#searches by category
		select "Cardio", from: "mobile_workouts_category_field"
		click_button "mobile_filter_button"

		expect(page).not_to have_css "h4", text: "TestOne"
		expect(page).to have_css "h4", text: "TestTwo"

		#searches by duration
		click_button "mobile_reset_filter"
		fill_in "mobile_duration_search_field", with: 45
		click_button "mobile_filter_button"

		expect(page).not_to have_css "h4", text: "TestOne"
		expect(page).to have_css "h4", text: "TestTwo"
	end

	def add_one_workout
		w1 = Workout.new(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
		w1.save!
	end

	def add_two_workouts
		w1 = Workout.new(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
		w2 = Workout.new(name: "TestTwo", category: "Cardio", description: "Test cardio workout", 
			duration: 45, weightFacility: nil, active: true, note: "Testing note for TestTwo")
		w1.save!
		w2.save!
	end
end