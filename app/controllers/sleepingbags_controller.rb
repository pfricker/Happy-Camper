class SleepingbagsController < ApplicationController
  def index
    @sleepingbags = Sleepingbag.all
  end

  def show
    @sleepingbag = Sleepingbag.find(params[:id])
  end
end
