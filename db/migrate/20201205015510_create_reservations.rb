class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :customer_name, null: false
      t.string :memo, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
