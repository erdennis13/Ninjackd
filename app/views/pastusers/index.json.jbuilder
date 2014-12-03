json.array!(@pastusers) do |pastuser|
  json.extract! pastuser, :id, :username, :email
  json.url pastuser_url(pastuser, format: :json)
end
