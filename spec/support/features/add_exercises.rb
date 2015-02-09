module Features
	def add_one_exercise(name, description)
		create(:exercise, name: name, description: description)
	end

	def add_exercise_to_workout(exercise, workout)
		create(:workoutbit, exercise_id: exercise.id, workout_id: workout.id)
	end
end