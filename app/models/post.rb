class Post < ActiveRecord::Base
	acts_as_votable

	belongs_to :user
	has_many :comments
	belongs_to :category

	has_many :order_posts

	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	validates :title, presence: true, length: { in: 6..30 }
  	validates :description, presence: true, length: { in: 10..800 }
  	validates :image, presence: true
  	validates_numericality_of :price, :greater_than_or_equal_to => 0
  	
  	before_destroy :ensure_not_referenced_by_any_line_item
 
	private
 
    def ensure_not_referenced_by_any_line_item
      if order_posts.empty?
        return true
      else
        errors.add(:base, 'Order post present')
        return false
      end
    end
end
