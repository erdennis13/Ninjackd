class Dailytip < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :tip
end
