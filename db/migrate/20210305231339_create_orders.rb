class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :pet_name
      t.string :owner_name
      t.date :delivery_date
      t.references :delivery, null: false, foreign_key: true
      t.decimal :delivery_cost
      t.decimal :discount
      t.string :state

      t.timestamps
    end
  end
end
