require "rails_helper"

describe Weeklyplan do
	it "has a valid factory" do
		expect(create(:weeklyplan)).to be_valid
	end
	it "is invalid without a name" do
		expect(build(:weeklyplan, name: nil)).not_to be_valid
	end
end