class SleepingbagsController < ApplicationController
  def index
    if params[:location].present? && params[:sleepingbag].present?
      @sleepingbags = Sleepingbag.advanced_search(params[:location], advanced_params).page params[:page]
    elsif params[:location].present?
      @sleepingbags = Sleepingbag.location_search(params[:location]).page params[:page]
    else
      @sleepingbags = Sleepingbag.all.page params[:page]
    end

    # SearchFilter.new(params).filter
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

  def advanced_params
    values = Hash.new

    values[:name] = params[:sleepingbag][:name] if params[:sleepingbag][:name].present?

    values[:brand] = params[:sleepingbag][:brand] if params[:sleepingbag][:brand].present?

    values[:temp_rating] = params[:sleepingbag][:temp_rating] if params[:sleepingbag][:temp_rating].present?

    values[:size] = params[:sleepingbag][:size] if params[:sleepingbag][:size].present?

    values[:fill] = params[:sleepingbag][:fill] if params[:sleepingbag][:fill].present?

    values[:condition] = params[:sleepingbag][:condition] if params[:sleepingbag][:condition].present?

    values
  end
end
