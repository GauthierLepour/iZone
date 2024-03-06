class RemoveInviteTokenFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :invite_token, :string
  end
end
