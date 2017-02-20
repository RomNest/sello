class CreateOrderPosts < ActiveRecord::Migration
  def change
    create_table :order_posts do |t|
      t.integer :post_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
