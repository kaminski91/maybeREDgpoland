class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.date :date
      t.text :content

      t.timestamps null: false
    end
  end
end
