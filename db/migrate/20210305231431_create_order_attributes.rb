class CreateOrderAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :order_attributes do |t|
      t.string :value
      t.references :attribute, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
