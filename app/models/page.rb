class Page < ActiveRecord::Base
  has_attached_file :retail_img
  validates_attachment_content_type :retail_img, :content_type => /\Aimage\/.*\Z/
end
