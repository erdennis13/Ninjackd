require "rails_helper"

describe Weeklybit do 
	it "has a valid factory" do
		expect(create(:weeklybit)).to be_valid
	end
end