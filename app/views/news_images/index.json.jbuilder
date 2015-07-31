json.array!(@news_images) do |news_image|
  json.extract! news_image, :id, :news_id
  json.url news_image_url(news_image, format: :json)
end
