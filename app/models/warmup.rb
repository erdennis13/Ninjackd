class Warmup < ActiveRecord::Base
	has_many :warmworks, dependent: :destroy
	has_many :workouts, through: :warmworks

	validates_presence_of :name, :description
end
