class TripsController < ApplicationController

  def index
    @trips = Trip.get_all
    @trip = Trip.new
  end

  def show
    @trip = Trip.find_by_id(params[:id])
    @lists = List.get_all({trip_id: params[:id]})
    @list = List.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(params["trip"])
    redirect_to "/trips"
  end

  def destroy
    Trip.destroy_by_id(params[:id])
    redirect_to "/trips/#{params[:trip_id]}"
  end

end
