class Category < ActiveRecord::Base
	has_many :posts
	validates :name, presence: true, length: { in: 6..15 }
end
