json.array!(@weekplans) do |weekplan|
  json.extract! weekplan, :id, :name, :sunday_workout_id, :monday_workout_id, :tuesday_workout_id, :wednesday_workout_id, :thursday_workout_id, :friday_workout_id, :saturday_workout_id
  json.url weekplan_url(weekplan, format: :json)
end
