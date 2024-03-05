class MembershipsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    if user_signed_in?
      create
    else
    end
  end

  def create
    @event = Event.find_by(invite_token: params[:event_invite_token])
    Membership.where(event: @event, user: current_user).first_or_create
    redirect_to event_path(@event)
  end
end
