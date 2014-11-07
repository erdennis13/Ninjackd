class Workout < ActiveRecord::Base
	has_many :workoutbits
	has_many :exercises, :through => :workoutbits
	accepts_nested_attributes_for :workoutbits

	has_many :subscriptions
	has_many :users, :through => :subscriptions


	scope :cat, -> (cat) { where category: cat }
	scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
	scope :duration_lt, lambda { |less_than| where('workouts.duration <= ?', less_than)}

	def self.search(term)
   		where("name like :term", term: "%#{term}%")
 	end
end
