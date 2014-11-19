class Weeklyplan < ActiveRecord::Base
	has_many :weeklybits, dependent: :destroy
	has_many :workouts, :through => :weeklybits
	accepts_nested_attributes_for :weeklybits
end
