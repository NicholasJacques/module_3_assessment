require 'rails_helper'

RSpec.desribe BestBuyService do
  context '#find_by_zip' do
    it 'returns raw data in json' do
      service = BestBuyService.new
      raw_stores = service.find_by_zip('80202')
      first_store = raw_stores.first

      expect(raw_stores.count).to eq(10)
      expect(raw_stores).to be_an(Array)
      expect(first_store).to be_a(Hash)
      expect(first_store).to have_key(:storeType)
      expect(first_store).to have_key(:longName)
      expect(first_store).to have_key(:city)
      expect(first_store).to have_key(:phone)
      expect(first_store).to have_key(:distance)
    end
  end
end

