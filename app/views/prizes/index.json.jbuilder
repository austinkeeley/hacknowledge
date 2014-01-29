json.array!(@prizes) do |prize|
  json.extract! prize, :id, :name, :description, :sponsor_id
  json.url prize_url(prize, format: :json)
end
