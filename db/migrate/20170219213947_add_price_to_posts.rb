class AddPriceToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :price, :decimal, precision: 12, scale: 3
  end
end
