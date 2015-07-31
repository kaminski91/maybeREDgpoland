class NewsImage < ActiveRecord::Base
  belongs_to :news
	has_attached_file :img, :styles => { :original => "300x300>" }
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
