require "rails_helper"

describe Workout do 
	it "has a valid factory" do
		expect(create(:workout)).to be_valid
	end
	it "invalid without name" do
		expect(build(:workout, name: nil)).not_to be_valid
	end
	it "invalid without description" do
		expect(build(:workout, description: nil)).not_to be_valid
	end
	it "invalid without category" do
		expect(build(:workout, category: nil)).not_to be_valid
	end
	it "invalid without duration" do
		expect(build(:workout, duration: nil)).not_to be_valid
	end
	it "returns sorted array by search term" do
		gutworkout = create(:workout, name: "Gut Workout")
		runworkout = create(:workout, name: "Run Workout")

		expect(Workout.search("Gut").first).to eq(gutworkout)
	end
end