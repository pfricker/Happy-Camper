class BackpacksController < ApplicationController
  def index
    @backpacks = Backpack.all
  end

  def show
    @backpack = Backpack.find(params[:id])
  end
end
