class Workout < ActiveRecord::Base
	has_many :workoutbits
	has_many :exercises, :through => :workoutbits
	accepts_nested_attributes_for :workoutbits

	scope :strength, -> { where(category: 'Strength')}


	scope :cat, -> (cat) { where category: cat }
	scope :starts_with, -> (name) { where("name like ?", "#{name}%")}

end
