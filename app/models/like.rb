class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :workout
	validates_uniqueness_of :workout_id, scope: :user_id
	validates_presence_of :workout_id, :user_id
end
