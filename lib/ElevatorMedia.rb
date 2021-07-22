require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'

class Streamer 
    def apiRequest 
        url = URI("https://pokeapi.co/api/v2/ability/4")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(url)
        response = http.request(request)
        json_response = JSON.parse(response.body)
        # return json_response
    end
    def getContent
        pokemon = self.apiRequest
        output = "<div>#{pokemon}</div>"
        return output
    end
end

