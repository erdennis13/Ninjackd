class Exercise < ActiveRecord::Base
	has_many :workoutbits
	has_many :workouts, :through => :workoutbits
end
