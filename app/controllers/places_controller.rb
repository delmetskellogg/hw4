class PlacesController < ApplicationController

  def index
    #@places = Place.where("user_id = ?", params[:user_id])
    @places = Place.all
  end

  def show
    @place = Place.find(params["id"])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params["place"])
    #@place.user = @current_user
    @place.save
    redirect_to "/places"
  end

end
