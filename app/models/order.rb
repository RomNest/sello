class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

	has_many :order_posts, :dependent => :destroy

	validates :full_name, :address, :email, :postcode, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  resourcify

  def add_order_posts_from_cart(cart)
    cart.order_posts.each do |order|
      order.cart_id = nil
      order_posts << order
    end
  end
end
