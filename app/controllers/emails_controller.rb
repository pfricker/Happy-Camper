class EmailsController < ApplicationController
  def create
    if params[:backpack]
      gear = Backpack.find(params[:backpack])
    elsif params[:tent]
      gear = Tent.find(params[:tent])
    elsif params[:sleepingbag]
      gear = Sleepingbag.find(params[:sleepingbag])
    end
    UserMailer.request_mailer(current_user, gear, date_params[:from_date], date_params[:to_date])
    redirect_to root_path
    flash[:notice] = "Your email has been sent."
  end


  private

  def date_params
    params.require(:date).permit(:from_date, :to_date)
  end
end
