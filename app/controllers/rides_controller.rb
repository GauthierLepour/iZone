class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end
  def new
    @ride = Ride.new
    @event = Event.find_by(invite_token: params[:event_invite_token])
  end

  def create
    @ride = Ride.new(ride_params)
    @event = Event.find_by(invite_token: params[:event_invite_token])
    @ride.event = @event
    if @ride.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @ride = Ride.find(params[:id])
  end

  private

  def ride_params
    params.require(:ride).permit(:departure_place, :arrival_place, :departure_time, :price, :seats, :car_id, :description)
  end
end
