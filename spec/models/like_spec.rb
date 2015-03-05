require "rails_helper"

describe Like do
	it "has a valid factory" do
		expect(create(:like)).to be_valid
	end
	it "invalid without user_id" do
		expect(build(:like, user_id: nil)).not_to be_valid
	end
	it "invalid without workout_id" do
		expect(build(:like, workout_id: nil)).not_to be_valid
	end
	it "invalid without unique workout_id, scope: user_id" do
		create(:like, user_id: 1, workout_id: 1)

		expect(build(:like, user_id:1, workout_id: 1)).not_to be_valid
	end
end