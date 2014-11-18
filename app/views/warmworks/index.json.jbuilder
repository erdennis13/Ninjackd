json.array!(@warmworks) do |warmwork|
  json.extract! warmwork, :id, :warmup_id, :workout_id
  json.url warmwork_url(warmwork, format: :json)
end
