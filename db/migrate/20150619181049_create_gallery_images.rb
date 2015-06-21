class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.belongs_to :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
