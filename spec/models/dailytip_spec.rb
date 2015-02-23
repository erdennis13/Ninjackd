require "rails_helper"

describe Dailytip do
	it "has a valid factory" do
		expect(create(:dailytip)).to be_valid
	end
	it "invalid without tip" do
		expect(build(:dailytip, tip: nil)).not_to be_valid
	end
end