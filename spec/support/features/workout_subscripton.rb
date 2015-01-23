module Features
	def add_subscription
		sign_user_in
		add_one_workout
		visit workouts_path

		within "#workouts_table" do
			click_link "TestOne"
		end

		fill_in "date_picker_desktop", with: Date.today
		click_button "subscribe_button_desktop"
	end

	def add_one_workout
		Workout.create(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
	end

	def add_two_workouts
		Workout.create(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
		Workout.create(name: "TestTwo", category: "Cardio", description: "Test cardio workout", 
			duration: 45, weightFacility: nil, active: true, note: "Testing note for TestTwo")
	end
end