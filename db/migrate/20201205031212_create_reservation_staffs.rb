class CreateReservationStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_staffs do |t|
      t.references :reservation, foreign_key: true
      t.references :staff, foreign_key: true
      t.timestamps
    end
  end
end
