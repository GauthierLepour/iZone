class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user: current_user)
    current_user.notification_count = 0
    current_user.save!
  end
end
