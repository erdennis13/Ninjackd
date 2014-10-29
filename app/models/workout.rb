class Workout < ActiveRecord::Base
	has_many :workoutassignments
	has_many :exercises, :through => :workoutassignments
end
