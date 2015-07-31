class CreateNewsImages < ActiveRecord::Migration
  def change
    create_table :news_images do |t|
      t.belongs_to :news, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
