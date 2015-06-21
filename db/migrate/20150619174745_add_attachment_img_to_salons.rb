class AddAttachmentImgToSalons < ActiveRecord::Migration
  def self.up
    change_table :salons do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :salons, :img
  end
end
