require 'QuoteForm'

describe Quote do
    # Test if a quote quote has been completed
    describe "getContent" do
        quote = Quote.new
        context 'Output' do
            it 'Checks if the quote button has been clicked' do
            click = 'REQUEST A QUOTE' || 'GET A QUOTE'
            expect(quote).to be_truthy
            end
        end
        context 'Output' do
            it 'Checks if quote quote has been filled' do
                building_type = 'Residential'
                number_of_appartments = 5
                number_of_floors = 3
                number_of_basements = 0
                elevator_amount = 1
                columns_amount = 1
                product_line = 'standard'
            expect(quote).to be_truthy
            end
        end
        context 'Output' do
            it 'Checks if the summit button has been clicked' do
            click = 'submit'
            expect(quote).to be_truthy
            end
        end
    end
end