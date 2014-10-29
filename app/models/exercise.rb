class Exercise < ActiveRecord::Base
	has_many :workoutassignments
	has_many :workouts, :through => :workoutassignments
end
