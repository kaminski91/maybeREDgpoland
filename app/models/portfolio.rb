class Portfolio < ActiveRecord::Base
	has_attached_file :brand
	has_attached_file :img
  validates_attachment_content_type :brand, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/

  def next
    Portfolio.where("np > ?", self.np).first
  end

  def prev
    Portfolio.where("np < ?", self.np).last
  end
end
