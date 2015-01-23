module Features
	def add_one_exercise(name, description)
		Exercise.create(name: name, description: description)
	end

	def add_exercise_to_workout(name, description)
		w1 = add_one_workout
		e1 = add_one_exercise(name, description)

		Workoutbit.create(workout_id: w1.id, exercise_id: e1.id, sets: 5, reps: 10, restime: 60)
		
	end
end