json.array!(@salons) do |salon|
  json.extract! salon, :id, :brand, :posX, :posY, :description, :country, :city, :address
  json.url salon_url(salon, format: :json)
end
