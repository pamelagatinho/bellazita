json.array!(@clients) do |client|
  json.extract! client, :name, :phone_number, :email, :birthday
  json.url client_url(client, format: :json)
end
