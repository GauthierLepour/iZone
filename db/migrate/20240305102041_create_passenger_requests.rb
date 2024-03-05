class CreatePassengerRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :passenger_requests do |t|
      t.string :status
      t.references :ride, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
