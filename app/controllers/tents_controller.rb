class TentsController < ApplicationController
  def index
    @tents = Tent.all.page params[:page]
  end

  def show
    @tent = Tent.find(params[:id])
  end
end
