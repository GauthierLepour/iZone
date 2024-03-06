class Users::SessionsController < Devise::SessionsController

  def new
    @event = Event.find_by_invite_token(params[:invite_token]) if params[:invite_token]
    super
  end

  def create
    @event = Event.find_by_invite_token(params[:user][:invite_token])
    Membership.where(event: @event, user: current_user).first_or_create if @event
    super
  end

  protected

  def after_sign_in_path_for(resource)
    @event = Event.find_by_invite_token(params[:invite_token]) if params[:invite_token]
    if @event
      event_path(@event) # Assuming you have a route helper `event_path` for the event
    else
      super
    end
  end
end
