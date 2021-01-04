class CreateCovers < ActiveRecord::Migration[6.0]
  def change
    create_table :covers do |t|
      t.references :user, foreign_key: true
      t.references :reservation, foreign_key: true
      t.timestamps
    end
  end
end
