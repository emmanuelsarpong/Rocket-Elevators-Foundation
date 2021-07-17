json.extract! address_geocode, :id, :address, :latitude, :longtitude, :created_at, :updated_at
json.url address_geocode_url(address_geocode, format: :json)
