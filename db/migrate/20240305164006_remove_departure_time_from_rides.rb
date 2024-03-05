class RemoveDepartureTimeFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column :rides, :departure_time, :time
  end
end
