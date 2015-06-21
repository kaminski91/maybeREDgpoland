json.array!(@news) do |news|
  json.extract! news, :id, :date, :content
  json.url news_url(news, format: :json)
end
