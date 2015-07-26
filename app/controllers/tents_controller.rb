class TentsController < ApplicationController
  def index
    if params[:location].present?
      @tents = Search.new(params).filter.page params[:page]
      locations(@tents)
    else
      @tents = Tent.all.page params[:page]
      locations(@tents)
    end
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

  def edit
    @tent = Tent.find(params[:id])
  end

  def update
    @tent = Tent.find(params[:id])
    if @tent.update(tent_params)
      flash[:notice] = "tent updated successfully"
      redirect_to tent_path(params[:id])
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

  def tent_params
    params.require(:tent).permit(:name, :brand, :capacity, :use, :condition, :image)
  end
end
