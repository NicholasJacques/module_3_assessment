class SearchPresenter
  attr_reader :stores, :total

  def initialize(stores, total)
    @stores = stores
    @total = total
  end
end
