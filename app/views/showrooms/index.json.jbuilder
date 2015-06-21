json.array!(@showrooms) do |showroom|
  json.extract! showroom, :id, :content
  json.url showroom_url(showroom, format: :json)
end
