class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :workout
	validates_uniqueness_of :workout_id, scope: :user_id
end
