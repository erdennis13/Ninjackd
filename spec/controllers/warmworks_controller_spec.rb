require "rails_helper"

describe WarmworksController do
	describe "#index" do
		it "renders index template" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe "#show" do
		it "renders show template" do
			warmwork = create(:warmwork)

			get :show, id: warmwork
		end
	end

	describe "#new" do
		it "saves a warmwork with attributes" do
			get :new

			expect(assigns(:warmwork)).to be_a_new(Warmwork)
		end
	end

	describe "#update" do
		before(:each) do
			@warmwork = create(:warmwork)
			@request.env['HTTP_REFERER'] = "/workouts/1"
		end
		context "With valid attributes" do
			it "finds the correct warmwork" do
				put :update, id: @warmwork, warmwork: attributes_for(:warmwork)

				expect(assigns(:warmwork)).to eq(@warmwork)
			end
			it "saves the updated attributes" do
				put :update, id: @warmwork, warmwork: attributes_for(:warmwork, workout_id: 2)

				@warmwork.reload
				expect(@warmwork.workout_id).to eq(2)
			end
		end

		context "With invalid attributes" do
			it "doesn't save the warmwork" do
				put :update, id: @warmwork, warmwork: attributes_for(:warmwork, workout_id: "fake")

				@warmwork.reload
				expect(@warmwork.workout_id).not_to eq("fake")
			end
		end
	end

	describe "#create" do
		before(:each) do
			@workout = create(:workout)
			@warmup = create(:warmup)
		end
		context "With Valid attributes" do
			it "redirects to the workout path" do
				@workout = create(:workout)
				post :create, warmwork: {warmup_id: @warmup.id, workout_id: @workout.id}

				expect(response).to redirect_to workout_path(@workout)
			end

			it "creates a warmwork" do
				@request.env['HTTP_REFERER'] = "/workouts/#{@workout.id}"

				expect{ post :create, warmwork: {warmup_id: @warmup.id, workout_id: @workout.id} }.to change(Warmwork,:count).by(1)
			end
		end
	end

	describe "#destroy" do
		before(:each) do
			@workout = create(:workout)
			warmup = create(:warmup)
			@request.env['HTTP_REFERER'] = "/workouts/#{@workout.id}"
			@warmwork = create(:warmwork, warmup_id: warmup.id, workout_id: @workout.id)
		end

		it "deletes the warmwork" do
			expect{ delete :destroy, id: @warmwork }.to change(Warmwork,:count).by(-1)
		end

		it "redirects to the workout page" do
			delete :destroy, id: @warmwork

			expect(response).to redirect_to workout_path @workout
		end
	end

end