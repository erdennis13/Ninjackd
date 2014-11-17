class Weekplan < ActiveRecord::Base
	has_many :workouts
	has_many :subscriptions, through: :workouts
end
