class TripsController < ApplicationController

  def index
    @trips = Trip.all.limit(100)
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
