class SleepingbagsController < ApplicationController
  def index
    if params[:location].present?
      @sleepingbags = Search.new(params).filter.page params[:page]
    else
      @sleepingbags = Sleepingbag.all.page params[:page]
    end

  end

  def show
    @sleepingbag = Sleepingbag.find(params[:id])
  end

  def new
    @sleepingbag = Sleepingbag.new
  end

  def create
    @sleepingbag = Sleepingbag.new(sleepingbag_params)
    @sleepingbag.sizer = current_sizer
    if @sleepingbag.save
      flash[:notice] = "Your sleepingbag has been added"
      redirect_to sizer_path(current_sizer.id)
    else
      render :new
    end
  end

  def edit
    @sleepingbag = Sleepingbag.find(params[:id])
  end

  def update
    @sleepingbag  = Sleepingbag.find(params[:id])
    if @sleepingbag.update(sleepingbag_params)
      flash[:notice] = "Sleepingbag updated successfully"
      redirect_to sleepingbag_path(params[:id])
    else
      render :new
    end
  end


  private

  def sleepingbag_params
    params.require(:sleepingbag).permit(:name, :brand, :temp_rating, :size, :condition, :fill, :image)
  end
end
