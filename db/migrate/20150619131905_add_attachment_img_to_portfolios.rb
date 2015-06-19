class AddAttachmentImgToPortfolios < ActiveRecord::Migration
  def self.up
    change_table :portfolios do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :portfolios, :img
  end
end
