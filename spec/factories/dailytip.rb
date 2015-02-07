FactoryGirl.define do
	factory :dailytip do
		tip "This is a test NinjaTip"
		user_id 1
		show_date Date.today
	end
end