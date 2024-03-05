class AddDepartureTimeFromRides < ActiveRecord::Migration[7.1]
  def change
    add_column :rides, :departure_time, :datetime
  end
end
