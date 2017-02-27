class OrderPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :cart
  belongs_to :order
  
  def total_price
    post.price * quantity
  end

  def get_quantity
  	quantity
  end
end
