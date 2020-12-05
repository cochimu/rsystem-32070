class CreateReservationPurposes < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_purposes do |t|
      t.references :reservation, foreign_key: true
      t.references :purpose, foreign_key: true
      t.timestamps
    end
  end
end
