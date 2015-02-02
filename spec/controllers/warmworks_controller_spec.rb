require "rails_helper"

describe WarmworksController do
	describe "#create" do
		it "creates the warmwork link" do
			post :create, warmwork: make_warmwork

			expect(response).to redirect_to workout_path(Workout.last)
		end
	end
	def make_warmwork
		workout = Workout.create(name: "TestOne", category: "Strength", description: "Test strength workout", 
			duration: 60, weightFacility: nil, active: true, note: "Testing note for TestOne")
		warmup = Warmup.create(name: "TestWarmup", description: "Test warmup description")
		{warmup_id: warmup.id, workout_id: workout.id}
	end
end