module Features
	def add_subscription workout
		sign_user_in
		visit workouts_path

		within "#workouts_table" do
			click_link workout.name
		end

		fill_in "date_picker_desktop", with: Date.today
		click_button "subscribe_button_desktop"
	end
end