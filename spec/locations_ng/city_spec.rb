require 'spec_helper'

module LocationsNg
  describe City do
    let(:city) { LocationsNg::City.new }

    describe '.all' do
      let(:cities_response) { File.read('spec/responses/cities.json') }

      it 'returns all cities' do
        expect(city.all).to eq(JSON.parse(cities_response))
      end
    end

    describe '.cities' do
      context 'when state is not found' do
        it 'returns error message' do
          expect(city.cities('Invalid State')).to eq({message: "No cities found for 'invalid_state'", status: 404})
        end
      end

      context 'when state is found' do
        it 'returns the cities of a specific state' do
          expect(city.cities('Akwa Ibom')).to eq(['Eket', 'Ikot Ekpene', 'Oron', 'Uyo'])
        end
      end
    end
  end
end
