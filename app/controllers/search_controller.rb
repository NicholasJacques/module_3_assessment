class SearchController < ApplicationController

  def index
    @stores = Store.find_by_zip(params[:search])
  end

end
