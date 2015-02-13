require "rails_helper"

describe WorkoutsController do
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

			expect(response).to render_template "index"
		end
	end

	describe "#add_daily_tip" do
		it "creates a daily tip" do
			expect { post :add_daily_tip, dailytip: attributes_for(:dailytip) }.to change(Dailytip,:count).by(1)
		end

		it "redirects to admin_path" do
			post :add_daily_tip, dailytip: attributes_for(:dailytip)
			expect(response).to redirect_to admin_path
		end

		it "doesn't save a nil tip" do
			expect { post :add_daily_tip, dailytip: attributes_for(:dailytip, tip: nil) }.to change(Dailytip,:count).by(0)
		end
	end

	describe "#add_new_user" do
		it "creates a user" do
			expect { post :add_new_user, user: attributes_for(:user) }.to change(User,:count).by(1)
		end

		it "redirects to admin path" do
			post :add_new_user, user: attributes_for(:user)
			expect(response).to redirect_to admin_path
		end

		it "validates presence of items" do
			expect { post :add_new_user, user: attributes_for(:user, email: nil) }.to change(User,:count).by(0)
		end
	end

	describe "#show" do
		it "shows workout" do
			workout = create(:workout)
			get :show, id: workout.id
			expect(response).to render_template "show"
		end
	end

	describe "#create" do
		it "creates a workout" do
			expect{ post :create, workout: attributes_for(:workout) }.to change(Workout,:count).by(1)
		end
	end

	describe "#usercreate" do
		it "creates multiple subscriptions" do
			user = create(:user)
			sign_in(user)

			expect{ post :usercreate }.to change(Weeklyplan,:count).by(1)
		end
	end

	describe "#add_weekly_subscription" do
		it "creates multiple subscriptions" do
			user = create(:user)
			sign_in(user)
			weeklyplan = create(:weeklyplan)
			workout = create(:workout)
			i = 1
			while i < 7 do
				create(:weeklybit, workout_id: workout.id, weeklyplan_id: weeklyplan.id, day: i)
				i+=1
			end

			expectation = 7 - (Date.today.wday+1)

			expect{ post :add_weekly_subscription, weeklyplan_id: weeklyplan.id }.to change(Subscription,:count).by(expectation)
		end
	end

	describe "#new" do
		it "saves a workout with attributes" do
			get :new
			expect(assigns(:workout)).to be_a_new(Workout)
		end
	end

	describe "#update" do

		before(:each) do
			@workout = create(:workout)
		end
		it "Located the correct workout" do
			put :update, id: @workout, workout: attributes_for(:workout, name: "Testing Update") 

			expect(assigns(:contact)).to eq(@contact)
		end

		it "Updated the atttributes" do
			put :update, id: @workout, workout: attributes_for(:workout, name: "Testing Update")

			@workout.reload
			expect(@workout.name).to eq("Testing Update")
		end

		it "Doesn't save invalid attributes" do
			put :update, id: @workout, workout: attributes_for(:workout, name: nil)

			@workout.reload
			expect(@workout.name).not_to eq(nil)
		end

		it "invalid attributes re-renders edit template" do
			put :update, id: @workout, workout: attributes_for(:workout, name: nil)

			expect(response).to redirect_to edit_workout_path @workout
		end
	end
end




















