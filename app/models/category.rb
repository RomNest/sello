class Category < ActiveRecord::Base
	has_many :posts
	validates :name, presence: true, length: { in: 2..15 }
end
