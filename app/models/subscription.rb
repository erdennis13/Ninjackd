class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :workout
	has_many :histories
	validates_uniqueness_of :workout_id, scope: :user_id
end
