require "rails_helper"

describe WorkoutsController do
	render_views
	describe "#index" do
		it "renders workout list" do

			sign_in("user@example.com")
			get :index

			expect(response).to render_template "index"
		end

		it "searches by scopes" do
			Workout.create(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
			user = User.create(name: "User", username: "Username", admin: false, paypal_payment_token: "Test", 
      email: "user@example.com", password: "password")

			sign_in user

			get :index, search: "Test", less_than: 75, cat: "Strength"

			#expect(response).to have_css "table tr td", text: "TestOne"
			expect(response).to render_template "index"
		end

	end
end