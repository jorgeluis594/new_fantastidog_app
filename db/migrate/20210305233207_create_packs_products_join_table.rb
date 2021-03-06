class CreatePacksProductsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :pack_products do |t|
      t.references :pack, null: false, foreign_key: { to_table: :products }
      t.references :products, null: false, foreign_key: true
    end
  end
end
