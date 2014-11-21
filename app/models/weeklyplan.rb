class Weeklyplan < ActiveRecord::Base
	has_many :weeklybits, dependent: :destroy
	has_many :workouts, :through => :weeklybits
	accepts_nested_attributes_for :weeklybits

	 def add_weeklyplan(weeklyplan, user)
 		@date = Date.today.beginning_of_week(:sunday)
		dates = Hash.new
		dates[1] = @date
		dates[2] = @date + 1
		dates[3] = @date + 2
		dates[4] = @date + 3
		dates[5] = @date + 4
		dates[6] = @date + 5
		dates[7] = @date + 6

 		@weeklyplan = weeklyplan
 		@dayinc = 1
 		7.times do
	 		@weeklyplan.weeklybits.each do |check|
	 			if check.day == @dayinc
	 				check.create_subscription(user, check.workout.id, dates[check.day])
	 			end
	 		end
	 		@dayinc += 1
	 	end
 	end

end
