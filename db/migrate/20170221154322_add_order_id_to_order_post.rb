class AddOrderIdToOrderPost < ActiveRecord::Migration
  def change
    add_column :order_posts, :order_id, :integer
  end
end
