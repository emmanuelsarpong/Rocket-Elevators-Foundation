class AddressGeocode < ApplicationRecord

	# EXAMPLE AddressGeocode.fromAddress("3512 40 Ave NW")
	# this caches geocode from addresses
	def self.fromAddress(address)
		addresses = AddressGeocode.where(address: address)
		if addresses.present? then
			if addresses.first.latitude != nil then
				return [addresses.first.latitude,addresses.first.longtitude]
			end
			return nil
		else
			georesults = Geocoder.search(address)
			newaddress = AddressGeocode.new()
			newaddress.address = address
			if georesults.present? then
				newaddress.latitude = georesults.first.coordinates[0]
				newaddress.longtitude = georesults.first.coordinates[1]
				newaddress.save
				return georesults.first.coordinates
			end
			newaddress.save
			return nil
		end
	end

	
end
