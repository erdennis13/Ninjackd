class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :workout
	has_many :histories, dependent: :destroy
	accepts_nested_attributes_for :workout

	#This only allows users to be subscribed to unique workouts, however, once they complete them, they can subscribe again
	validates_uniqueness_of :workout_id, scope: [:user_id, :schedule], conditions: -> { where(complete: false) }
	validates_presence_of :user_id, :workout_id, :schedule
	validate :schedule_is_valid_date

	def schedule_is_valid_date
		if !schedule.is_a?(Date)
			errors.add(:schedule, 'must be a valid date')
		end
	end
end
