class PassengerRequestsController < ApplicationController

  def index
    @passenger_requests = PassengerRequest.all
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @passenger_request = PassengerRequest.new(status: "pending")
    @passenger_request.user = current_user
    @passenger_request.ride = @ride
    if @passenger_request.save
      notif = Notification.new(passenger_request: @passenger_request, user: @passenger_request.driver,
                               description: "wants to book a seat in your car!")
      notif.save!
      @passenger_request.driver.notification_count += 1
      @passenger_request.driver.save!
      redirect_to events_path
      flash[:notice] = "A request has been sent to the driver."
    end
  end

  def edit
    @passenger_request = PassengerRequest.find(params[:id])
  end

  def update
    @passenger_request = PassengerRequest.find(params[:id])
    @passenger_request.update(status: passenger_request_params[:status].downcase)
    # We will need a if statement to send 2 different notif depending on the new status
    notif = Notification.new(passenger_request: @passenger_request, user: @passenger_request.user,
                             description: "has #{@passenger_request.status}ed your request.")
    @passenger_request.user.notification_count += 1
    @passenger_request.user.save!
    if @passenger_request.status == "accept"
      @passenger_request.user.memberships.find_by(event: @passenger_request.ride.event).update(role: "passenger")

    end
    notif.save!
    redirect_to root_path
  end

  private

  def passenger_request_params
    params.require(:passenger_request).permit(:status)
  end
end
