class RemoveNotificationCountToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :notification_count, :integer
  end
end
