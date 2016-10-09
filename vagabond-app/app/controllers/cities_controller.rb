class CitiesController < ApplicationController
  def index
  	@cities = City.all
  end

  def show
    @city = City.find_by(url_display: params[:city_url_display])
    @page = params[:page]
    if @city.posts.count > (@page.to_i * 10) + 10
    	@posts = @city.posts.all[(0 + (10 * @page.to_i))...(10 + (10 * @page.to_i))]
    else
    	@posts = @city.posts.all[(-10..-1)]
    end
  end

  def new
  end
end
