class SearchController < ApplicationController
  def index
    binding.pry
    @type = params[:search_category]
    if @type == "Backpack"
      redirect_to backpacks_path(params)
    elsif @type == "Sleepingbag"
      redirect_to sleepingbags_path(params)
    else
      redirect_to tents_path(params)
    end
  end
end
