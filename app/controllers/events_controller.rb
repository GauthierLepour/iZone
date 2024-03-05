class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by_invite_token(params[:invite_token])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
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
