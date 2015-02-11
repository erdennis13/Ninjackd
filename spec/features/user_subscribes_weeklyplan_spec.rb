require "rails_helper"

feature "User subscribes to weeklyplan" do
	scenario "successfully" do
		sign_user_in
		weeklyplan = create(:weeklyplan)
		workout = create(:workout)
		i = 1
		while i < 7 do
			create(:weeklybit, workout_id: workout.id, weeklyplan_id: weeklyplan.id, day: i)
			i+=1
		end

		visit workouts_path

		click_on "#{weeklyplan.name}_subscribe"

		expect(page).to have_content "Weeklyplan was added successfully to your subscriptions. Enjoy!"
	end
end