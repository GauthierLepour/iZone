class EventsController < ApplicationController
  def index
    @my_events = Event.where(user: current_user)
    @my_memberships = Membership.where(user: current_user)
    @my_memberships = @my_memberships.reject { |membership| membership.role == "Owner" }
    @joined_events = @my_memberships.map(&:event)
  end

  def show
    @event = Event.find_by_invite_token(params[:invite_token])
    @link = "https://www.i2one.me/events/#{@event.invite_token}/memberships/new"
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
      Membership.create!(role: "Owner", user: current_user, event: @event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find_by(invite_token: params[:invite_token])
  end

  def update
    @event = Event.find_by(invite_token: params[:invite_token])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find_by(invite_token: params[:invite_token])
    @event.destroy
    redirect_to event_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :photo, :address)
  end
end
