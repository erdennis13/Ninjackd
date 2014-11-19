class Workout < ActiveRecord::Base
	has_many :workoutbits, dependent: :destroy
	has_many :exercises, :through => :workoutbits
	accepts_nested_attributes_for :workoutbits

	has_many :weeklybits, dependent: :destroy
	has_many :weeklyplans, :through => :weeklybits
	accepts_nested_attributes_for :workoutbits

	has_many :warmworks, dependent: :destroy
	has_many :warmups, through: :warmworks
	accepts_nested_attributes_for :warmworks

	has_many :subscriptions
	has_many :users, :through => :subscriptions
	has_many :likes
	has_many :users, :through => :likes
	has_many :comments
	has_many :users, :through => :comments
	has_many :weekplans
	

	validates_presence_of :name, :description, :category, :duration


	scope :cat, -> (cat) { where category: cat }
	scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
	scope :duration_lt, lambda { |less_than| where('workouts.duration <= ?', less_than)}
	scope :facility, -> (facility) { where weightFacility: facility }

	def self.search(term)
   		where("name like :term", term: "%#{term}%")
 	end

end
