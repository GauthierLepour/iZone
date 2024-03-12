class AddPriceToRides < ActiveRecord::Migration[7.1]
  def change
    add_monetize :rides, :price, currency: { present: false }
  end
end
