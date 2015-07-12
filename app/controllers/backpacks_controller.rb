class BackpacksController < ApplicationController
  def index
    binding.pry
    @backpacks = Backpack.all.page params[:page]
  end

  def show
    @backpack = Backpack.find(params[:id])
  end

  def new
    @backpack = Backpack.new
  end

  def create
    @backpack = Backpack.new(backpack_params)
    @backpack.user = current_user
    if @backpack.save
      flash[:notice] = "Your backpack has been added."
      redirect_to user_path(current_user.id)
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
