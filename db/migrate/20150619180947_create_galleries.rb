class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.boolean :rotator

      t.timestamps null: false
    end
    add_index :galleries, :name, unique: true
  end
end
