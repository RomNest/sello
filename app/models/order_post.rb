class OrderPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :cart
end
