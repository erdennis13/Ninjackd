class History < ActiveRecord::Base
	belongs_to :subscription
	validates_uniqueness_of :exercise_id, scope: :subscription_id
end
