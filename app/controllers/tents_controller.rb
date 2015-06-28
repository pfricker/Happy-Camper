class BackpacksController < ApplicationController
  def index
    @tents = Tent.all
  end

  def show
    @tent = Tent.find(params[:id])
  end
end
