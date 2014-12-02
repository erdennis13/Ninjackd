json.array!(@dailytips) do |dailytip|
  json.extract! dailytip, :id, :tip
  json.url dailytip_url(dailytip, format: :json)
end
