class BackpacksController < ApplicationController
  def index
    @backpacks = Backpack.all.page params[:page]
  end

  def show
    @backpack = Backpack.find(params[:id])
  end

  def new
    @backpack = Backpack.new
  end

  
end
