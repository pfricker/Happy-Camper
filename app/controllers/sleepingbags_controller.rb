class SleepingbagsController < ApplicationController
  def index
    @sleepingbags = Sleepingbag.all.page params[:page]
  end

  def show
    @sleepingbag = Sleepingbag.find(params[:id])
  end
end
