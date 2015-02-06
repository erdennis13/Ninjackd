FactoryGirl.define do
	factory :workout do
		name "TestWorkout"
		category "Strength"
		description "Test description of workout"
		duration 60
		note "Test note for workout"
	end
end