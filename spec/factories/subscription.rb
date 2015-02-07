FactoryGirl.define do
	factory :subscription do
		user_id 1
		workout_id 1
		schedule Date.today
	end
end