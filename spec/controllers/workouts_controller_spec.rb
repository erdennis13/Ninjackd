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
      workout = create(:workout)
      user = create(:user)

			sign_in user

			get :index, search: "Test", less_than: 75, cat: workout.category

			#expect(response).to have_css "table tr td", text: "TestOne"
			expect(response).to render_template "index"
		end

	end

	describe "#create" do
		it "creates a workout" do
			expect{ post :create, workout: attributes_for(:workout) }.to change(Workout,:count).by(1)
		end
	end
end