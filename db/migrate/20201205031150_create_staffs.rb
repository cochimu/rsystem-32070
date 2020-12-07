class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :name,   null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
