json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :workout_id, :comment
  json.url comment_url(comment, format: :json)
end
