require "rails_helper"

describe WorkoutbitsController do 
	describe "#index" do
		it "renders index template" do
			get :index

			expect(response).to render_template :index
		end
	end

	describe "#show" do
		it "renders the show template" do
			workoutbit = create(:workoutbit)
			get :show, id: workoutbit

			expect(response).to render_template :show
		end
	end

	describe "#new" do
		it "saves a new workoutbit with attributes" do
			get :new

			expect(assigns(:workoutbit)).to be_a_new(Workoutbit)
		end
	end

	describe "#create" do
		it "creates a workoutbit" do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			expect{ post :create, workoutbit: attributes_for(:workoutbit)}.to change(Workoutbit,:count).by(1)
		end
	end

	describe "#update" do
		before(:each) do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			@workoutbit = create(:workoutbit)
		end
		context "With valid attributes" do
			it "locates the record" do
				put :update, id: @workoutbit, workoutbit: attributes_for(:workoutbit, reps: 15)

				expect(assigns(:workoutbit)).to eq(@workoutbit)
			end
			it "saves the updated record" do
				put :update, id: @workoutbit, workoutbit: attributes_for(:workoutbit, reps: 15)

				@workoutbit.reload
				expect(@workoutbit.reps).to eq(15)
			end
		end

		context "With invalid attributes" do
			it "doesn't save the updated record" do
				put :update, id: @workoutbit, workoutbit: attributes_for(:workoutbit, reps: nil)

				@workoutbit.reload
				expect(@workoutbit.reps).not_to eq(nil)
			end
		end
	end

	describe "#destroy" do
		before(:each) do
			@workout = create(:workout)
			@request.env['HTTP_REFERER'] = '/workouts/1'
			@workoutbit = create(:workoutbit)
		end
		it "deletes the record" do
			expect{ delete :destroy, id: @workoutbit }.to change(Workoutbit,:count).by(-1)
		end
		it "redirects back to workout page" do
			delete :destroy, id: @workoutbit

			expect(response).to redirect_to workout_path @workout
		end
	end

end