class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :img, :styles => { :original => "1000x1000>", :thumb => "120x120#" }
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
