require 'ElevatorMedia'
require 'faraday'

describe Streamer do
    # Test if a String value type is returned
    describe "getContent" do
        streamer = Streamer.new
        context 'output' do
            it 'Returns an HTML link' do
            expect(streamer.getContent).to be_kind_of String
            end
        end
    end
    # Test if the apiRequest method returns a JSON type value
    describe "API request" do
        streamer = Streamer.new
        context 'output' do
            it 'Returns a JSON data type' do
            expect(streamer.apiRequest).to be_a Hash
            end
        end
    end
end

# require 'faraday'

# Faraday.get('https://pokeapi.co/api/v2/ability/4')

# p response.status
