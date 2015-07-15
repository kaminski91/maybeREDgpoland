json.array!(@made_in_gs) do |made_in_g|
  json.extract! made_in_g, :id, :content
  json.url made_in_g_url(made_in_g, format: :json)
end
