class Workout < ActiveRecord::Base
	has_many :workoutbits
	has_many :exercises, :through => :workoutbits
end
