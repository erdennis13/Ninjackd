class Exercise < ActiveRecord::Base
	has_many :workoutbits
	has_many :workouts, :through => :workoutbits
	
	has_attached_file :diagram, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :diagram, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
