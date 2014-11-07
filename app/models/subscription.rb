class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :workout
	has_many :histories
end
