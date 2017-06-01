class SearchController < ApplicationController

  def index
    @search_results = SearchPresenter.new(params[:search])

    # @stores = Store.find_by_zip(params[:search])
  end

end
