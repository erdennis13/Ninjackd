require "rails_helper"

describe Workoutbit do 
	it "has a valid factory" do
		expect(create(:workoutbit)).to be_valid
	end
	it "invalid without reps" do
		expect(build(:workoutbit, reps: nil)).not_to be_valid
	end
	it "invalid without sets" do
		expect(build(:workoutbit, sets: nil)).not_to be_valid
	end
	it "invalid without restime" do
		expect(build(:workoutbit, restime: nil)).not_to be_valid
	end
	it "invalid without exercise_id" do
		expect(build(:workoutbit, exercise_id: nil)).not_to be_valid
	end
	it "invalid without workout_id" do
		expect(build(:workoutbit, workout_id: nil)).not_to be_valid
	end
	it "invalid without unique exercise_id, scope: workout_id" do
		create(:workoutbit, exercise_id: 1, workout_id: 1)

		expect(build(:workoutbit, exercise_id: 1, workout_id: 1)).not_to be_valid
	end
end