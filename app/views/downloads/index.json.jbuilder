json.array!(@downloads) do |download|
  json.extract! download, :id, :user_id
  json.url download_url(download, format: :json)
end
