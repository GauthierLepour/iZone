class RemovePriceFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column :rides, :price
  end
end
