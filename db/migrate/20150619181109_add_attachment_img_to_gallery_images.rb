class AddAttachmentImgToGalleryImages < ActiveRecord::Migration
  def self.up
    change_table :gallery_images do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :gallery_images, :img
  end
end
