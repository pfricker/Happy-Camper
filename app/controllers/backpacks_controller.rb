class BackpacksController < ApplicationController
  def index
    if params[:location].present? && params[:backpack].present?
      @backpacks = Backpack.advanced_search(params[:location], advanced_params).page params[:page]
    elsif params[:location].present?
      @backpacks = Backpack.advanced_search(params[:location])
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

  def advanced_params
    values = Hash.new

    values[:name] = params[:backpack][:name] if params[:backpack][:name].present?

    values[:brand] = params[:backpack][:brand] if params[:backpack][:brand].present?

    values[:capacity] = params[:backpack][:capacity] if params[:backpack][:capacity].present?

    values[:size] = params[:backpack][:size] if params[:backpack][:size].present?

    values[:gender] = params[:backpack][:gender] if params[:backpack][:gender].present?

    values[:condition] = params[:backpack][:condition] if params[:backpack][:condition].present?

    values
  end
end
