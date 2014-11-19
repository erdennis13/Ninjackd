json.array!(@weeklybits) do |weeklybit|
  json.extract! weeklybit, :id, :weeklyplan_id, :workout_id, :day
  json.url weeklybit_url(weeklybit, format: :json)
end
