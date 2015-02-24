require "rails_helper"

describe HistoriesController do 
	describe "#index" do
		it "renders index template" do
			get :index

			expect(response).to render_template :index
		end
	end

	describe "#show" do
		it "renders show template" do
			history = create(:history)
			get :show, id: history

			expect(response).to render_template :show
		end
	end

	describe "#new" do
		it "saves a history with attributes" do
			get :new
			expect(assigns(:history)).to be_a_new(History)
		end
	end

	describe "#currentWorkout" do
		it "redirects to current workout path when not complete and not empty" do
			create_subscription(1)
			get :currentWorkout, subscription_id: @subscription

			expect(response).to render_template :currentWorkout
		end

		it "redirects to completed workout url when complete and empty" do
			create_subscription(0)

			get :currentWorkout, subscription_id: @subscription

			expect(response).to redirect_to completedWorkout_url(workout_id: @subscription.workout.id)
		end

		it "updates start time" do
			create_subscription(1)
			get :currentWorkout, subscription_id: @subscription

			@subscription.reload
			expect(@subscription.start_time).not_to be(nil)
		end

		it "updates finish time" do
			create_subscription(0)
			get :currentWorkout, subscription_id: @subscription

			@subscription.reload
			expect(@subscription.finish_time).not_to be(nil)
		end

	end

	describe "#mark_all_complete" do
		it "marks all of the exercises complete" do
			create_subscription(5)

			expect{post :mark_all_complete, subscription_id: @subscription}.to change(History,:count).by(5)
		end
		it "redirects to completed workout url" do
			create_subscription(1)
			post :mark_all_complete, subscription_id: @subscription

			expect(response).to redirect_to completedWorkout_url(workout_id: @subscription.workout.id)
		end
	end


	describe "#create" do
		it "creates a history" do
			@request.env['HTTP_REFERER'] = '/currentWorkout'
			expect{ post :create, history: attributes_for(:history) }.to change(History,:count).by(1)
		end
	end

	describe "#update" do
		before(:each) do
			@history = create(:history)
			@request.env['HTTP_REFERER'] = '/currentWorkout'
		end
		context "With valid attributes" do
			it "locates the record" do
				put :update, id: @history, history: attributes_for(:history, reps: 5) 

				expect(assigns(:history)).to eq(@history)
			end

			it "saves the updated record" do
				put :update, id: @history, history: attributes_for(:history, reps: 5) 

				@history.reload
				expect(@history.reps).to eq(5)
			end
		end

		context "With invalid attributes" do
			it "does not save the record" do
				put :update, id: @history, history: attributes_for(:history, reps: nil) 

				@history.reload
				expect(@history.reps).not_to eq(nil)				
			end
		end
	end

	describe "#destroy" do
		it "deletes the record" do
			@request.env['HTTP_REFERER'] = '/currentWorkout'
			history = create(:history)

			expect{ delete :destroy, id: history }.to change(History,:count).by(-1)
		end
	end

	def create_subscription numExercises
		workout = create(:workout)
		if numExercises > 0
			numExercises.times do
				exercise = create(:exercise)
				workoutbit = create(:workoutbit, workout_id: workout.id, exercise_id: exercise.id)
			end
		end
		@subscription = create(:subscription, workout_id: workout.id)
	end

end