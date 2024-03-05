class RidesController < ApplicationController
  include Wicked::Wizard

  steps :general, :car, :price

  def create
    @event = Event.find(params[:event_id])
    @ride = Ride.create
    redirect_to wizard_path(steps.first, ride_id: @ride.id)
  end
end
