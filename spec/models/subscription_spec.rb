require "rails_helper"

describe Subscription do 
	it "has a valid factory" do
		expect(create(:subscription)).to be_valid
	end
	it "invalid without user id" do
		expect(build(:subscription, user_id: nil)).not_to be_valid
	end
	it "invalid without workout_id" do
		expect(build(:subscription, workout_id: nil)).not_to be_valid
	end
	it "invalid without schedule" do
		expect(build(:subscription, schedule: nil)).not_to be_valid
	end
	it "invalid without unique workout_id, scope: user_id, schedule; where its incomplete" do
		create(:subscription, workout_id: 1, user_id: 1, schedule: "2015/01/01", complete: false)

		expect(build(:subscription, workout_id: 1, user_id: 1, schedule: "2015/01/01", complete: false)).
			not_to be_valid
	end
	it "invalid with invalid date type" do
		expect(build(:subscription, schedule: "invalid")).not_to be_valid
	end
end