require "rails_helper"

describe Weeklybit do 
	it "has a valid factory" do
		expect(create(:weeklybit)).to be_valid
	end
	it "invalid without day" do
		expect(build(:weeklybit, day: nil)).not_to be_valid
	end
	it "invalid without weeklyplan_id" do
		expect(build(:weeklybit, weeklyplan_id: nil)).not_to be_valid
	end
	it "invalid without workout_id" do
		expect(build(:weeklybit, workout_id: nil)).not_to be_valid
	end
end