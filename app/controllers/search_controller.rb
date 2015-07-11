class SearchController < ApplicationController
  def index
    binding.pry
    unless params[:search] == ""
      @backpacks = Backpack.search(params[:search])
      @tents = Tent.search(params[:search])
      @sleepingbags = Sleepingbag.search(params[:search])
    else
      @backpacks = Backpack.all
      @tents = Tent.all
      @sleepingbags = Sleepingbag.all
    end
  end
end
