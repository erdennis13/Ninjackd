if Rails.env == 'development'
	PayPal::Recurring.configure do |config|
		config.sandbox = true
		config.username = "ethan-facilitator_api1.ninjackd.com"
		config.password = "YCBQEVMJ4G3VZ92A"
		config.signature = "AFcWxV21C7fd0v3bYYYRCpSSRl31A04tHaO4E.Hfp5Q3FVkg9-S6znzB"
	end
elsif Rails.env == 'production'
	PayPal::Recurring.configure do |config|
		config.sandbox = false
		config.username = "ethan_api1.ninjackd.com"
		config.password = "8MQHBZLZWK54KWZA"
		config.signature = "AFcWxV21C7fd0v3bYYYRCpSSRl31A1j2CmxXHI18zEl1NwwhN23geUVY"
	end
end