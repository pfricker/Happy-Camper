class TripsController < ApplicationController
  def index
    if location.nil?
      redirect_to root_path
      flash[:notice] = "We weren't able to find that loctaion."
    else
      @name = location["formatted_address"]
      @data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_API_KEY']}/planner_#{dates}/q/#{lat},#{lng}.json")
      @backpacks =  Search.new(backpack_params).filter.page params[:page]
      @tents =  Search.new(tent_params).filter.page params[:page]
      @sleepingbags =  Search.new(sleepingbag_params).filter.page params[:page]
    end

  end

  private

  def sleepingbag_params
    lower_limit = @data["trip"]["temp_low"]["min"]["F"].to_i - 5
    upper_limit = @data["trip"]["temp_low"]["avg"]["F"]

    if lower_limit > 40
      lower_limit = 40
    end

     {"search_category"=>"Sleepingbag",
     "location"=>"#{params[:location]}",
     "radius"=>"100",
     "backpack"=>{"search"=>"", "capacity"=>{"min"=>"", "max"=>""}, "size"=>"", "gender"=>"", "condtion"=>""},
     "tent"=>{"search"=>"", "capacity"=>"", "use"=>"", "condition"=>""},
     "sleepingbag"=>{"temp_rating"=>{"min"=>"#{lower_limit}", "max"=>"#{upper_limit}"}, "size"=>"", "fill"=>"", "condition"=>""}
     }
  end

  def duration
    start_date = params["date"]["start_date"].delete('^0-9').to_i
    end_date = params["date"]["end_date"].delete('^0-9').to_i
    end_date - start_date
  end

  def min_pack_size
    if duration > 8
      75
    elsif duration <= 8 && duration >= 4
      55
    elsif duration < 4
      40
    end
  end

  def max_pack_size
    if duration > 8
      110
    elsif duration <= 8 && duration >= 4
      85
    elsif duration < 4
      65
    end
  end

  def backpack_params
    {"search_category"=>"Backpack",
     "location"=>"#{params[:location]}",
     "radius"=>"100",
     "backpack"=>{"search"=>"", "capacity"=>{"min"=>"#{min_pack_size}", "max"=>"#{max_pack_size}"}, "size"=>"", "gender"=>"", "condtion"=>""},
     "tent"=>{"search"=>"", "capacity"=>"", "use"=>"", "condition"=>""},
     "sleepingbag"=>{"temp_rating"=>{"min"=>"", "max"=>""}, "size"=>"", "fill"=>"", "condition"=>""}
    }
  end

  def tent_params
    {"search_category"=>"Tent",
     "location"=>"#{params[:location]}",
     "radius"=>"100",
     "backpack"=>{"search"=>"", "capacity"=>{"min"=>"", "max"=>""}, "size"=>"", "gender"=>"", "condtion"=>""},
     "tent"=>{"search"=>"", "capacity"=>"#{params[:people]}", "use"=>"", "condition"=>""},
     "sleepingbag"=>{"temp_rating"=>{"min"=>"", "max"=>""}, "size"=>"", "fill"=>"", "condition"=>""}
    }
   end

  def dates
    dates = params["date"]["start_date"][5..9] + params["date"]["end_date"][5..9]
    dates.delete!('^0-9')
  end

  def location
    location = Geocoder.search(params[:destination])
    if location.empty?
      return nil
    else
      location.first.data
    end
  end

  def lat
    location["geometry"]["location"]["lat"]
  end

  def lng
    location["geometry"]["location"]["lng"]
  end

end
