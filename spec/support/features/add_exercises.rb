module Features
	def add_one_exercise(name, description)
		create(:exercise, name: name, description: description)
	end

	def add_exercise_to_workout(exercise, workout)

		Workoutbit.create(workout_id: workout.id, exercise_id: exercise.id, sets: 5, reps: 10, restime: 60)
		
	end
end