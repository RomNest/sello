class Cart < ActiveRecord::Base
	has_many :order_posts, :dependent => :destroy
end
