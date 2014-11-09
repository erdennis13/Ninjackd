class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :workout
	has_many :histories, dependent: :destroy
	validates_uniqueness_of :workout_id, scope: :user_id
	validates_presence_of :user_id, :workout_id
end
