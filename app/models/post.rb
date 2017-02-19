class Post < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments
	belongs_to :category
	
	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	validates :title, presence: true, length: { in: 6..20 }
  	validates :description, presence: true, length: { in: 10..800 }
  	validates :image, presence: true
  	validates_numericality_of :price, :greater_than_or_equal_to => 0
end
