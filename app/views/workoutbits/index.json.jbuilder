json.array!(@workoutbits) do |workoutbit|
  json.extract! workoutbit, :id, :workout_id, :exercise_id, :sets, :reps
  json.url workoutbit_url(workoutbit, format: :json)
end
