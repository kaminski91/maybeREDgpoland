class AddAttachmentRetailImgToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :retail_img
    end
  end

  def self.down
    remove_attachment :pages, :retail_img
  end
end
