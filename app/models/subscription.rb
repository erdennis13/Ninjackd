class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :workout
	has_many :histories, dependent: :destroy

	#This only allows users to be subscribed to unique workouts, however, once they complete them, they can subscribe again
	validates_uniqueness_of :workout_id, scope: :user_id, conditions: -> { where(complete: false) }
	validates_presence_of :user_id, :workout_id
end
