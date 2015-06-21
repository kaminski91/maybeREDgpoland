class CreateShowrooms < ActiveRecord::Migration
  def change
    create_table :showrooms do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
