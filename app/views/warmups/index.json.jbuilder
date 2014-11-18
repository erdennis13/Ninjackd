json.array!(@warmups) do |warmup|
  json.extract! warmup, :id, :name, :description
  json.url warmup_url(warmup, format: :json)
end
