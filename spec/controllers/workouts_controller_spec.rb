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

	describe "#create" do
		it "creates a workout" do
			expect{ post :create, workout: attributes_for(:workout) }.to change(Workout,:count).by(1)
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

end