class InviteLinksController < ApplicationController
  def show
    @event = Event.find_by(invite_token: params[:event_invite_token])
    @link = "http://localhost:3000/events/#{@event.invite_token}/memberships/new"
  end
end
