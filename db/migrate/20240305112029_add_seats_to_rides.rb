class AddSeatsToRides < ActiveRecord::Migration[7.1]
  def change
    add_column :rides, :seats, :integer
  end
end
