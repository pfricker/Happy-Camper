class TripsController < ApplicationController
  def index
    zip = params["destination"]
    dates = params["date"]["start_date"][5..9] + params["date"]["end_date"][5..9]
    dates.delete!('^0-9')
    response = HTTParty.get("http://api.wunderground.com/api/2d2aff62ce2b475a/planner_#{dates}/q/#{zip}.json")
    binding.pry
  end


end
