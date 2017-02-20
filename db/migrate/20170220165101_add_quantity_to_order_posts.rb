class AddQuantityToOrderPosts < ActiveRecord::Migration
  def self.up
    add_column :order_posts, :quantity, :integer, :default => 1
  end
 
  def self.down
    remove_column :order_posts, :quantity
  end
end
