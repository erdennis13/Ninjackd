class Warmwork < ActiveRecord::Base
	belongs_to :warmup
	belongs_to :workout
	accepts_nested_attributes_for :warmup
	validates_uniqueness_of :warmup_id, scope: :workout_id
	validates_presence_of :warmup_id, :workout_id
end
