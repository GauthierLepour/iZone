class AddNotificationCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :notification_count, :integer
  end
end
