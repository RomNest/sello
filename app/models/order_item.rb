class OrderItem < ActiveRecord::Base
  belongs_to :post
  belongs_to :order
end
