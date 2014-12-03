json.array!(@userreviews) do |userreview|
  json.extract! userreview, :id, :user_id, :review
  json.url userreview_url(userreview, format: :json)
end
