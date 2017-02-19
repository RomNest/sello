class AddPriceToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :price, :double
  end
end
