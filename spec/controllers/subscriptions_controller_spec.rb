require "rails_helper"

describe SubscriptionsController do
	describe "#index" do
		it "renders index template" do
			get :index

			expect(response).to render_template :index
		end
	end

	describe "#show" do
		it "renders show template" do
			subscription = create(:subscription)

			get :show, id: subscription

			expect(response).to render_template :show
		end
	end

	describe "#new" do
		it "creates a new subscription with attributes" do
			get :new

			expect(assigns(:subscription)).to be_a_new(Subscription)
		end
	end

	describe "#create" do
		it "makes a run of the mill subscription" do
			post :create, subscription: set_up_creation(Date.today)

			expect(response).to redirect_to profile_path
		end

		it "handles funky date formats" do
			post :create, subscription: set_up_creation("01/29/2015")

			expect(response).to redirect_to workout_path @workout
		end

		it "handles empty date fields" do
			post :create, subscription: set_up_creation(nil)

			expect(response).to redirect_to workout_path @workout
		end

	end
	def set_up_creation schedule
			@workout = create(:workout)
			user = create(:user)
			sign_in user

			new_sub = {user_id: user.id, workout_id: @workout.id, schedule: schedule}
	end

	describe "#destroy" do
		before(:each) do
			@subscription = create(:subscription)
		end

		it "deletes the record" do
			expect{ delete :destroy, id: @subscription }.to change(Subscription,:count).by(-1)
		end

		it "redirects to profile url" do
			delete :destroy, id: @subscription

			expect(response).to redirect_to profile_path
		end

	end
end