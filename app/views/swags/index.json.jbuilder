json.array!(@swags) do |swag|
  json.extract! swag, :id
  json.url swag_url(swag, format: :json)
end
