json.array!(@participants) do |participant|
  json.extract! participant, :id, :first_name, :last_name, :role
  json.url participant_url(participant, format: :json)
end
