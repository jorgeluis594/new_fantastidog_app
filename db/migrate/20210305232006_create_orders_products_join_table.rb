class CreateOrdersProductsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :products, :orders
  end
end
