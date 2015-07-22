class BackpacksController < ApplicationController
  def index
    if params[:location].present?
      @backpacks = Search.new(params).filter.page params[:page]
    else
      @backpacks = Backpack.all.page params[:page]
    end
  end

  def show
    @backpack = Backpack.find(params[:id])
  end

  def new
    @backpack = Backpack.new
  end

  def create
    @backpack = Backpack.new(backpack_params)
    @backpack.sizer = current_sizer
    if @backpack.save
      flash[:notice] = "Your backpack has been added."
      redirect_to sizer_path(current_sizer.id)
    else
      render :new
    end
  end

  def edit
    @backpack = Backpack.find(params[:id])
  end

  def update
    @backpack = Backpack.find(params[:id])
    if @backpack.update(backpack_params)
      flash[:notice] = "Backpack updated successfully."
      redirect_to backpack_path(params[:id])
    else
      render :new
    end
  end

  private

  def backpack_params
    params.require(:backpack).permit(
      :name,
      :brand,
      :capacity,
      :size,
      :condition,
      :gender,
      :image
    )
  end
end
