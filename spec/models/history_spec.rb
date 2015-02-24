require "rails_helper"

describe History do
	it "has a valid factory" do
		expect(create(:history)).to be_valid
	end
	it "invalid without subscription_id" do
		expect(build(:history, subscription_id: nil)).not_to be_valid
	end
	it "invalid without exercise_id" do
		expect(build(:history, exercise_id: nil)).not_to be_valid
	end
	it "invalid without complete" do
		expect(build(:history, complete: nil)).not_to be_valid
	end	
	it "invalid without unique exercise_id, scope: subscription_id" do
		create(:history, subscription_id: 1, exercise_id: 1)

		expect(build(:history, subscription_id: 1, exercise_id: 1)).not_to be_valid
	end
end