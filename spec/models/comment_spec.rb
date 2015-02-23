require "rails_helper"

describe Comment do
	it "has a valid factory" do
		expect(create(:comment)).to be_valid
	end
	it "invalid without comment" do
		expect(build(:comment, comment: nil)).not_to be_valid
	end
end