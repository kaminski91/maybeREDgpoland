class AddAttachmentImgToShowrooms < ActiveRecord::Migration
  def self.up
    change_table :showrooms do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :showrooms, :img
  end
end
