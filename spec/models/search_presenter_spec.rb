require 'rails_helper'

RSpec.describe SearchPresenter do
  it 'can be created with a zipcode argument' do
    presenter = SearchPresenter.new("80201")

    expect(presenter.stores).to be_an(Array)
    expect(presenter.stores.count).to be(10)
    # expect(presenter.total).to eq(16)
  end
end
