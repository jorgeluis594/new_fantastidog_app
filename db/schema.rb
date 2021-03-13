# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_05_233207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characteristics", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_characteristics_on_product_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_attributes", force: :cascade do |t|
    t.string "value"
    t.bigint "characteristic_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["characteristic_id"], name: "index_order_attributes_on_characteristic_id"
    t.index ["order_id"], name: "index_order_attributes_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "pet_name"
    t.string "owner_name"
    t.date "delivery_date"
    t.bigint "delivery_id", null: false
    t.decimal "delivery_cost"
    t.decimal "discount"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_id"], name: "index_orders_on_delivery_id"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
  end

  create_table "pack_products", force: :cascade do |t|
    t.bigint "pack_id", null: false
    t.bigint "products_id", null: false
    t.index ["pack_id"], name: "index_pack_products_on_pack_id"
    t.index ["products_id"], name: "index_pack_products_on_products_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "status", default: "active", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characteristics", "products"
  add_foreign_key "order_attributes", "characteristics"
  add_foreign_key "order_attributes", "orders"
  add_foreign_key "orders", "deliveries"
  add_foreign_key "pack_products", "products", column: "pack_id"
  add_foreign_key "pack_products", "products", column: "products_id"
end
