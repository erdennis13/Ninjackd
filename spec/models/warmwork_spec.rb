require "rails_helper"

describe Warmwork do
	it "has a valid factory" do
		expect(create(:warmwork)).to be_valid
	end
	it "invalid without workout_id" do
		expect(build(:warmwork, workout_id: nil)).not_to be_valid
	end
	it "invalid without warmup_id" do
		expect(build(:warmwork, warmup_id: nil)).not_to be_valid
	end	
end