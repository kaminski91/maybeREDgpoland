class AddAttachmentImgToMadeInGs < ActiveRecord::Migration
  def self.up
    change_table :made_in_gs do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :made_in_gs, :img
  end
end
