class BackpacksController < ApplicationController
  def index
    if params[:location].present?
      @backpacks = Search.new(params).filter.page params[:page]
      locations(@backpacks)
    else
      @backpacks = Backpack.all.page params[:page]
      locations(@backpacks)
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

  def locations(items)
    @hash = Gmaps4rails.build_markers(items) do |item, marker|
      marker.infowindow %{ #{item.brand} #{item.name} <br> from: #{item.user.username}}
      marker.lat item.user.latitude
      marker.lng item.user.longitude
    end
  end

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
