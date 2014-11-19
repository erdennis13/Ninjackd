class Weeklybit < ActiveRecord::Base
	belongs_to :workout
	belongs_to :weeklyplan
	accepts_nested_attributes_for :workout
end
