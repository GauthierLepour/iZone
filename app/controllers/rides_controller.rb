class RidesController < ApplicationController
  def new
    @ride = Ride.new
    @event = Event.find(params[:event_id])
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    @event = Event.find(params[:event_id])
    if @ride.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:departure_place, :arrivel_place, :departure_time, :price, :car)
  end
end
