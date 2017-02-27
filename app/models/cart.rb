class Cart < ActiveRecord::Base
	has_many :order_posts, :dependent => :destroy
  resourcify
  
	def add_post(post_id)
    	current_post = order_posts.find_by_post_id(post_id)
    	if current_post
      		current_post.quantity += 1
    	else
      		current_post = order_posts.build(:post_id => post_id)
    	end
    	current_post
  	end

  	def total_price
    	order_posts.to_a.sum { |order| order.total_price }
  	end
    
    def total_items
      line_items.sum(:quantity)
    end
end
