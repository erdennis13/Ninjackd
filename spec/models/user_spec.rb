require "rails_helper"

describe User do 
	it "has a valid factory" do
		expect(create(:user)).to be_valid
	end
	it "has valid admin factory" do
		admin = create(:admin)
		expect(admin.admin).to eq(true)
	end
	it "invalid without name" do
		expect(build(:user, name: nil)).not_to be_valid
	end
	it "invalid without username" do
		expect(build(:user, username: nil)).not_to be_valid
	end
	it "invalid without unique username" do
		create(:user, username: "testinguniqueness")

		expect(build(:admin, username: "testinguniqueness")).not_to be_valid
	end
	it "invalid without unique email" do
		create(:user, email: "unique@email.com")

		expect(build(:admin, email: "unique@email.com")).not_to be_valid
	end
	it "checks if already liked workout, returns false if already liked" do
		user = create(:user)
		workout = create(:workout)
		like = create(:like, user_id: user.id, workout_id: workout.id)

		expect(user.already_liked?(workout)).to eq(false)
	end
	it "checks if already liked workout, returns true if not liked" do
		user = create(:user)
		workout = create(:workout)

		expect(user.already_liked?(workout)).to eq(true)
	end
end