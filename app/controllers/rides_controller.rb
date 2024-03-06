class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end
  def new
    @ride = Ride.new
    @event = Event.find(params[:event_id])
  end

  def create
    @ride = Ride.new(ride_params)
    @event = Event.find(params[:event_id])
    @ride.event = @event
    if @ride.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:departure_place, :arrival_place, :departure_time, :price, :seats, :car_id)
  end
end
p
