class Weeklybit < ActiveRecord::Base
	belongs_to :workout
	belongs_to :weeklyplan
	accepts_nested_attributes_for :workout
	validates_presence_of :day, :weeklyplan_id, :workout_id

	# def create_subscription(user, workout, schedule)
 # 		@sub = Subscription.new
 # 		@sub.user_id = user
 # 		@sub.workout_id = workout
 # 		@sub.schedule = schedule
 # 		@sub.save
 # 	end


end
