require "rails_helper"

describe CommentsController do
	describe "#create" do
		before(:each) do
			@workout = create(:workout)
			@user = create(:user)
			sign_in @user
		end
		it "makes a regular comment" do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			post :create, comment: set_up_creation("This is a test comment")

			expect(response).to redirect_to workout_path @workout
		end
		it "requires text in comment field" do
			@request.env['HTTP_REFERER'] = '/workouts/1'
			post :create, comment: {user_id: @user.id, workout_id: @workout.id, comment: nil}

			expect(response).to redirect_to workout_path @workout
		end
	end
	def set_up_creation comment

		attributes = {user_id: @user.id, workout_id: @workout.id, comment: comment}
	end
end