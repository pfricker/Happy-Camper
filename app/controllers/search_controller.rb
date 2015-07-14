class SearchController < ApplicationController
  def index
    @type = params[:search_category]
    if @type == "Backpack"
      @results = Backpack.search(params[:search]).page params[:page]
    elsif @type == "Sleepingbag"
      @results = Sleepingbag.search(params[:search]).page params[:page]
    else
      @results = Tent.search(params[:search]).page params[:page]
    end

    # redirect_to tents_path(params)
  end
end
