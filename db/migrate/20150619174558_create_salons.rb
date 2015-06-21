class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :brand
      t.float :posX
      t.float :posY
      t.text :description
      t.string :coutry
      t.string :city
      t.string :address

      t.timestamps null: false
    end
  end
end
