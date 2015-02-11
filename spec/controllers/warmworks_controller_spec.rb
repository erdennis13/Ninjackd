require "rails_helper"

describe WarmworksController do
	describe "#create" do
		it "creates the warmwork link" do
			@workout = create(:workout)
			post :create, warmwork: make_warmwork

			expect(response).to redirect_to workout_path(@workout)
		end
	end

	def make_warmwork
		warmup = create(:warmup)

		{warmup_id: warmup.id, workout_id: @workout.id}
	end
end