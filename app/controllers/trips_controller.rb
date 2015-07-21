class TripsController < ApplicationController
  def index
    response = Geocoder.search(params["destination"])
    data = response.first.data
    lat = data["geometry"]["location"]["lat"]
    lng = data["geometry"]["location"]["lng"]
    @name = data["formatted_address"]
    @from = params["date"]["start_date"]
    @to = params["date"]["end_date"]
    @data = HTTParty.get("http://api.wunderground.com/api/2d2aff62ce2b475a/planner_#{dates}/q/#{lat},#{lng}.json")
  end


  private

  def dates
    dates = params["date"]["start_date"][5..9] + params["date"]["end_date"][5..9]
    dates.delete!('^0-9')
  end
end
