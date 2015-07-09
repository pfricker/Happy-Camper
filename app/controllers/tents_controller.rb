class TentsController < ApplicationController
  def index
    @tents = Tent.all.page params[:page]
  end

  def show
    @tent = Tent.find(params[:id])
  end

  def new
    @tent = Tent.new
  end

  def create
    @tent = Tent.new(tent_params)
    @tent.user = current_user
    if @tent.save
      flash[:notice] = "Your tent has been added"
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  
  private

  def tent_params
    params.require(:tent).permit(:name, :brand, :capacity, :use, :condition, :image)
  end
end
