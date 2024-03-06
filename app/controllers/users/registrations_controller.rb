class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @event = Event.find_by_invite_token(params[:invite_token]) if params[:invite_token]
    super
  end

  def create
    super
    if resource.save && params[:user].key?(:invite_token)
      @event = Event.find_by_invite_token(params[:user][:invite_token])
      Membership.create(event: @event, user: resource)
    end
  end

  protected

  def after_sign_up_path_for(resource)
    @event = Event.find_by_invite_token(params[:invite_token]) if params[:invite_token]
    if @event
      event_path(@event)
    else
      super
    end
  end
end
