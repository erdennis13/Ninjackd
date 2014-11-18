class Warmwork < ActiveRecord::Base
	belongs_to :warmup
	belongs_to :workout
	accepts_nested_attributes_for :warmup
end
