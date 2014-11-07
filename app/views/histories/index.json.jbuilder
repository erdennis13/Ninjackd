json.array!(@histories) do |history|
  json.extract! history, :id, :subscription_id, :exercise_id, :complete
  json.url history_url(history, format: :json)
end
