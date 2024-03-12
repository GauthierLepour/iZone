class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    current_rides = current_user.passenger_requests.where(status: "accept").map(&:ride)
    my_rides = Ride.all.select { |ride| ride.car.user == current_user }
    current_rides += my_rides
    @current_chatrooms = current_rides.map(&:chatroom)
  end

  def edit
    @chatroom = Chatroom.find(params[:id])
  end

  def update
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.update(chatroom_params)
      redirect_to chatroom_path(@chatroom)
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
