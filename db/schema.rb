# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_28_071121) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "regular_id"
    t.integer "category_id"
    t.integer "orderitem_id"
    t.string "item_name", null: false
    t.integer "price", null: false
    t.integer "item_quantity", null: false
    t.boolean "disable", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["orderitem_id"], name: "index_items_on_orderitem_id"
    t.index ["regular_id"], name: "index_items_on_regular_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "adress", null: false
    t.string "user_id", null: false
    t.integer "group", null: false
    t.boolean "regular_member", default: false
    t.boolean "admin_member", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "orderitems", force: :cascade do |t|
    t.integer "orderitem_quantity"
    t.integer "order_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_orderitems_on_item_id"
    t.index ["order_id"], name: "index_orderitems_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "member_id"
    t.integer "orderitem_id"
    t.integer "date"
    t.integer "time_limit"
    t.integer "status"
    t.datetime "order_time"
    t.integer "order_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_orders_on_member_id"
    t.index ["orderitem_id"], name: "index_orders_on_orderitem_id"
  end

  create_table "regulars", force: :cascade do |t|
    t.integer "member_id"
    t.integer "item_id"
    t.integer "regular_quantity", null: false
    t.datetime "update_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_regulars_on_item_id"
    t.index ["member_id"], name: "index_regulars_on_member_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_statuses_on_member_id"
    t.index ["order_id"], name: "index_statuses_on_order_id"
  end

end
