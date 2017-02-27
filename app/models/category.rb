class Category < ActiveRecord::Base
	resourcify
	has_many :posts
	validates :name, presence: true, length: { in: 2..15 }
end
