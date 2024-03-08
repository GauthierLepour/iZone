class PassengerRequestsController < ApplicationController
  def create
    @ride = Ride.find(params[:ride_id])
    @passenger_request = PassengerRequest.new
    @passenger_request.user = current_user
    @passenger_request.ride = @ride
    if @passenger_request.save
      redirect_to events_path
      flash[:notice] = "You have successfully booked your seat"
    end
  end
end
