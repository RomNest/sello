class OrderPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :cart

  def total_price
    post.price * quantity
  end

  def get_quantity
  	quantity
  end
end