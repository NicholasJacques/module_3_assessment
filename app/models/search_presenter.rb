class SearchPresenter
  attr_reader :stores

  def initialize(zip)
    @stores = Store.find_by_zip(zip)
    # @total = Store.total_results
  end
end
