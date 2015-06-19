class AddAttachmentBrandToPortfolios < ActiveRecord::Migration
  def self.up
    change_table :portfolios do |t|
      t.attachment :brand
    end
  end

  def self.down
    remove_attachment :portfolios, :brand
  end
end
