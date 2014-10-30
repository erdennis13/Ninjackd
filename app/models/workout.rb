class Workout < ActiveRecord::Base
	has_many :workoutbits
	has_many :exercises, :through => :workoutbits
	accepts_nested_attributes_for :workoutbits
end
