class Search
  attr_accessor :params
  def initialize (params)
    @params = params
  end

  def type
    @params[:search_category]
  end

  def query_class
    if type == "Backpack"
      Backpack
    elsif type == "Tent"
      Tent
    elsif type == "Sleepingbag"
      Sleepingbag
    end
  end

  def filter
    query = query_class

    if params[:location].present?
      query = query.joins(:user).near(params[:location], params[:radius], order: 'distance')
    end

    if params[:backpack][:search].present?
      query = query.where("name ILIKE :search OR brand ILIKE :search", search: "#{params[:backpack][:search]}")
    end

    if params[:backpack][:capacity][:min].present? && params[:backpack][:capacity][:max].present?
      query = query.where("capacity BETWEEN ? AND ?", params[:backpack][:capacity][:min], params[:backpack][:capacity][:max])
    end

    if params[:backpack][:size].present?
      query = query.where("size = ?", params[:backpack][:size])
    end

    if params[:backpack][:gender].present?
      query = query.where("gender = ?", params[:backpack][:gender])
    end

    if params[:backpack][:condition].present?
      query = query.where("condition = ?", params[:backpack][:condition])
    end

    if params[:tent][:search].present?
      query = query.where("name ILIKE :search OR brand ILIKE :search", search: "#{params[:tent][:search]}")
    end

    if params[:tent][:capacity].present?
      query = query.where("capacity = ?", params[:tent][:capacity])
    end

    if params[:tent][:use].present?
      query = query.where("use = ?", params[:tent][:use])
    end

    if params[:tent][:condition].present?
      query = query.where("condition = ?", params[:tent][:condition])
    end

    if params[:sleepingbag][:search].present?
      query = query.where("name ILIKE :search OR brand ILIKE :search", search: "#{params[:sleepingbag][:search]}")
    end

    if params[:sleepingbag][:temp_rating][:min].present? && params[:sleepingbag][:temp_rating][:max].present?
      query = query.where("temp_rating BETWEEN ? AND ?", params[:sleepingbag][:temp_rating][:min], params[:sleepingbag][:temp_rating][:max])
    end

    if params[:sleepingbag][:size].present?
      query = query.where("size = ?", params[:sleepingbag][:size])
    end

    if params[:sleepingbag][:fill].present?
      query = query.where("fill = ?", params[:sleepingbag][:fill])
    end

    if params[:sleepingbag][:condition].present?
      query = query.where("condition = ?", params[:sleepingbag][:condition])
    end
    query
  end


end
