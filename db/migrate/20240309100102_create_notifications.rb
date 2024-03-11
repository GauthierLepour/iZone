class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :passenger_request, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
