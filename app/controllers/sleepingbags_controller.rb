class SleepingbagsController < ApplicationController
  def index
    @sleepingbags = Sleepingbag.all.page params[:page]
  end

  def show
    @sleepingbag = Sleepingbag.find(params[:id])
  end

  def new
    @sleepingbag = Sleepingbag.new
  end

  def create
    @sleepingbag = Sleepingbag.new(sleepingbag_params)
    @sleepingbag.user = current_user
    if @sleepingbag.save
      flash[:notice] = "Your sleepingbag has been added"
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

    private

    def sleepingbag_params
      params.require(:sleepingbag).permit(:name, :brand, :temp_rating, :size, :condition, :fill, :image)
    end
end
