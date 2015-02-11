require "rails_helper"

describe CommentsController do
	describe "#create" do
		before(:each) do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			@workout = create(:workout)
			@user = create(:user)
			sign_in @user
		end

		it "makes a regular comment" do
			expect{ post :create, comment: attributes_for(:comment) }.to change(Comment,:count).by(1)
		end
		it "requires text in comment field" do
			post :create, comment: {user_id: @user.id, workout_id: @workout.id, comment: nil}

			expect(response).to redirect_to workout_path @workout
		end
	end

	describe "Delete destroy" do

		before(:each) do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			@workout = create(:workout)
			@user = create(:user)
			sign_in @user
			@comment = create(:comment, workout_id: @workout.id, user_id: @user.id)
		end

		it "deletes the comment" do
			expect{ delete :destroy, id: @comment }.to change(Comment,:count).by(-1)
		end

		it "redirects to workout page" do
			delete :destroy, id: @comment

			expect(response).to redirect_to workout_path @workout
		end
	end

	def set_up_creation comment

		attributes = {user_id: @user.id, workout_id: @workout.id, comment: comment}
	end

end