require 'rails_helper'

RSpec.describe BestBuyService do
  context '#find_by_zip' do
    it 'returns raw data in json' do
      service = BestBuyService.new
      results = service.find_by_zip('80202')
      raw_stores = results[:stores]
      first_store = raw_stores.first

      expect(results).to be_a(Hash)
      expect(results[:total]).to eq(16)
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

