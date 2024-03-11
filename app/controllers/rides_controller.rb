class RidesController < ApplicationController
  def index
    @event = Event.find_by(invite_token: params[:event_invite_token])
    @search_marker = []
    @markers = []
    @rides = @event.rides.where(arrival_place: @event.address)
    if params[:query].present? && params[:distance].present?
      @coordinates = Geocoder.coordinates(params[:query])
      @result_rides = Ride.near(@coordinates, params[:distance])
      @rides = @result_rides.where(arrival_place: @event.address)
      @search_marker = [{ lat: @coordinates[0],
                          lng: @coordinates[1],
                          marker_html: render_to_string(partial: "rides/marker") }]
    end
    unless @rides.empty?
      @markers = @rides.geocoded.map do |ride|
        {
          lat: ride.latitude,
          lng: ride.longitude,
          info_window_html: render_to_string(partial: "rides/info_window", locals: { ride: ride })
        }
      end
    end
  end

  def back
    @event = Event.find_by(invite_token: params[:event_invite_token])
    @search_marker = []
    @markers = []
    @rides = @event.rides.where(departure_place: @event.address)
    if params[:query].present? && params[:distance].present?
      @coordinates = Geocoder.coordinates(params[:query])
      @result_rides = Ride.near(@coordinates, params[:distance])
      @rides = @result_rides.where(departure_place: @event.address)
      @search_marker = [{ lat: @coordinates[0],
                          lng: @coordinates[1],
                          marker_html: render_to_string(partial: "rides/marker") }]
    end
    unless @rides.empty?
      @markers = @rides.geocoded.map do |ride|
        {
          lat: ride.latitude,
          lng: ride.longitude,
          info_window_html: render_to_string(partial: "rides/info_window", locals: { ride: ride })
        }
      end
    end
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
      current_user.memberships.find_by(event: @event).update(role: "driver")
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @ride = Ride.find(params[:id])
    @passenger_request = PassengerRequest.new
  end

  private

  def ride_params
    params.require(:ride).permit(:departure_place, :arrival_place, :departure_time, :price, :seats, :car_id, :description)
  end
end
