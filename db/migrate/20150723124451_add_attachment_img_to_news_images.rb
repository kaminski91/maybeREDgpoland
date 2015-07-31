class AddAttachmentImgToNewsImages < ActiveRecord::Migration
  def self.up
    change_table :news_images do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :news_images, :img
  end
end
