require 'rails_helper'

RSpec.describe Store do
  it 'can be created from a hash' do
    raw_store = {
      storeType: "Mobile SAS",
      longName: "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
      city: "DENVER",
      phone: "281-330-8004",
      distance: 3.45,
    }

    store = Store.new(raw_store)

    expect(store.type).to eq('Mobile SAS')
    expect(store.long_name).to eq('BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER')
    expect(store.city).to eq('DENVER')
    expect(store.phone).to eq('281-330-8004')
    expect(store.distance).to eq(3.45)
  end

  it '.find_by_zip' do
    results = Store.find_by_zip("80202")

    expect(results).to be_a(SearchPresenter)
    expect(results.stores.count).to eq(10)
    expect(results.total).to be(16)
  end
end
