json.array!(@pages) do |page|
  json.extract! page, :id, :startText, :aboutText
  json.url page_url(page, format: :json)
end
