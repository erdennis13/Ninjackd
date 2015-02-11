require "rails_helper"

describe LikesController do
	describe "#create" do
		before(:each) do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			@workout = create(:workout)
			@user = create(:user)
			sign_in @user
			@like = create(:like, user_id: @user.id, workout_id: @workout.id)
		end

		it "redirects to workout page" do
			post :create, like: {workout_id: @workout.id, user_id: @user.id}

			expect(response).to redirect_to workout_path @workout
		end

		it "creates like" do
			expect{ post :create, like: {workout_id: @workout.id, user_id: @user.id+1} }.to change(Like,:count).by(1)
		end
	end

	describe "#destroy" do
		before(:each) do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			@workout = create(:workout)
			@user = create(:user)
			sign_in @user
			@like = create(:like, user_id: @user.id, workout_id: @workout.id)
		end

		it "deletes like" do
			expect{ delete :destroy, id: @like }.to change(Like,:count).by(-1)
		end

	end
end