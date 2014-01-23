json.array!(@authentications) do |authentication|
  json.extract! authentication, :id, :provider, :uid
  json.url authentication_url(authentication, format: :json)
end
