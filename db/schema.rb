# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151231210520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bleeds", force: :cascade do |t|
    t.boolean  "front"
    t.boolean  "back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "box_counts", force: :cascade do |t|
    t.integer  "box_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_cards", force: :cascade do |t|
    t.integer  "price"
    t.integer  "print_method_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ink_color_id"
    t.integer  "bleed_id"
    t.integer  "raised_ink_id"
    t.integer  "dimension_id"
    t.integer  "paper_type_id"
    t.integer  "coating_id"
    t.integer  "quantity_id"
    t.integer  "cost"
  end

  add_index "business_cards", ["bleed_id"], name: "index_business_cards_on_bleed_id", using: :btree
  add_index "business_cards", ["coating_id"], name: "index_business_cards_on_coating_id", using: :btree
  add_index "business_cards", ["dimension_id"], name: "index_business_cards_on_dimension_id", using: :btree
  add_index "business_cards", ["ink_color_id"], name: "index_business_cards_on_ink_color_id", using: :btree
  add_index "business_cards", ["paper_type_id"], name: "index_business_cards_on_paper_type_id", using: :btree
  add_index "business_cards", ["print_method_id"], name: "index_business_cards_on_print_method_id", using: :btree
  add_index "business_cards", ["quantity_id"], name: "index_business_cards_on_quantity_id", using: :btree
  add_index "business_cards", ["raised_ink_id"], name: "index_business_cards_on_raised_ink_id", using: :btree

  create_table "coatings", force: :cascade do |t|
    t.string   "front"
    t.string   "back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dimensions", force: :cascade do |t|
    t.float    "width"
    t.float    "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ink_colors", force: :cascade do |t|
    t.integer  "front"
    t.integer  "back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paper_types", force: :cascade do |t|
    t.string   "brand"
    t.string   "name"
    t.string   "color"
    t.integer  "thickness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "print_methods", force: :cascade do |t|
    t.string   "print_method"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "quantities", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raised_inks", force: :cascade do |t|
    t.integer  "front"
    t.integer  "back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "business_cards", "bleeds"
  add_foreign_key "business_cards", "coatings"
  add_foreign_key "business_cards", "dimensions"
  add_foreign_key "business_cards", "ink_colors"
  add_foreign_key "business_cards", "paper_types"
  add_foreign_key "business_cards", "print_methods"
  add_foreign_key "business_cards", "quantities"
  add_foreign_key "business_cards", "raised_inks"
end
