require "rails_helper"

describe WarmworksController do
	describe "#create" do
		before(:each) do
			@workout = create(:workout)
			@warmup = create(:warmup)
		end

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