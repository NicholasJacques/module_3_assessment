class SearchController < ApplicationController

  def index
    @search_results = Store.find_by_zip(params[:search])
  end

end
