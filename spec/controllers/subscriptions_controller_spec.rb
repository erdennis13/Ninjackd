require "rails_helper"

describe SubscriptionsController do
	describe "#create" do
		it "makes a run of the mill subscription" do
			post :create, subscription: set_up_creation(Date.today)

			expect(response).to redirect_to profile_path
		end

		it "handles funky date formats" do
			post :create, subscription: set_up_creation("01/29/2015")

			expect(response).to redirect_to workout_path Workout.last
		end

		it "handles empty date fields" do
			post :create, subscription: set_up_creation(nil)

			expect(response).to redirect_to workout_path Workout.last
		end

	end
	def set_up_creation schedule
			workout = Workout.create(name: "TestOne", category: "Strength", description: "Test strength workout", 
				duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
			user = User.create(name: "User", username: "Username", admin: false, paypal_payment_token: "Test", 
      	email: "user@example.com", password: "password")
			sign_in user

			new_sub = {user_id: user.id, workout_id: workout.id, schedule: schedule}
	end
end