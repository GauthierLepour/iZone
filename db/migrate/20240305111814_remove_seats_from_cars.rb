class RemoveSeatsFromCars < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :seats, :integer
  end
end
