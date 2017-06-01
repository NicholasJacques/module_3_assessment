class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def index
    render status: 200, json: Item.all
  end

  def show
    render status: 200, json: Item.find(params[:id])
  end

  def destroy
    render status: 204, json: Item.delete(params[:id])
  end

end
