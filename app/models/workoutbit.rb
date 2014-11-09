class Workoutbit < ActiveRecord::Base
	belongs_to :workout
	belongs_to :exercise
	accepts_nested_attributes_for :exercise

	validates_uniqueness_of :exercise_id, scope: :workout_id
	validates_presence_of :exercise_id, :workout_id, :sets, :reps
end
