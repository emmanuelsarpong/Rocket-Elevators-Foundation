require 'QuoteCalculator'

describe Calculator do
    let(:calculator) {Calculator.new}

    context 'Output:' do
        it 'Returns installation fees for standard service' do
            expect(calculator.multiply(7565,0.10)).to eq(756.5)
        end
    end

    context 'Output:' do
        it 'Returns installation fees for premium service' do
            expect(calculator.multiply(12345,0.13)).to eq(1604.8500000000001)
        end
    end

    context 'Output:' do
        it 'Returns installation fees for excelium service' do
            expect(calculator.multiply(15400,0.16)).to eq(2464)
        end
    end
end