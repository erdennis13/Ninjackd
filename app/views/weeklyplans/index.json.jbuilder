json.array!(@weeklyplans) do |weeklyplan|
  json.extract! weeklyplan, :id, :name
  json.url weeklyplan_url(weeklyplan, format: :json)
end
