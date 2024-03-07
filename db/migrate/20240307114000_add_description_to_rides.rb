class AddDescriptionToRides < ActiveRecord::Migration[7.1]
  def change
    add_column :rides, :description, :text
  end
end
