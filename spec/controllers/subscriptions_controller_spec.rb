require "rails_helper"

describe SubscriptionsController do
	describe "#create" do
		it "makes a subscription" do
			workout = Workout.create(name: "TestOne", category: "Strength", description: "Test strength workout", 
				duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
			user = User.create(name: "User", username: "Username", admin: false, paypal_payment_token: "Test", 
      	email: "user@example.com", password: "password")
			sign_in user
			#schedule = "2015/01/29"
			schedule = Date.today
			new_sub = {user_id: user.id, workout_id: workout.id, schedule: schedule}

			post :create, subscription: new_sub

			expect(response).to redirect_to profile_path

		end
	end
end