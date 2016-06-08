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

ActiveRecord::Schema.define(version: 20160608201137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "company_notes"
    t.string   "twitter_handle"
    t.string   "phone_number"
    t.text     "address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "mailing_street"
    t.string   "mailing_suite"
    t.string   "mailing_city"
    t.string   "mailing_state"
    t.string   "mailing_zip"
    t.string   "shipping_street"
    t.string   "shipping_suite"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_zip"
    t.string   "country"
    t.string   "secondary_email"
    t.text     "customer_notes"
    t.boolean  "registered"
    t.boolean  "subscribed"
    t.integer  "rating"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.integer  "company_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.string   "zip_code"
    t.string   "source"
    t.string   "stage"
    t.string   "product"
    t.string   "material"
    t.string   "color"
    t.string   "width"
    t.string   "length"
    t.string   "quantity"
    t.string   "lead_time"
    t.text     "application"
    t.boolean  "new_lead"
    t.boolean  "registered"
    t.boolean  "subscribed"
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "phone_number"
    t.datetime "created_time"
    t.datetime "modified_time"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "sku"
    t.decimal  "unit_price"
    t.decimal  "cost"
    t.string   "short_description"
    t.text     "description"
    t.string   "vendor"
    t.string   "category"
    t.integer  "qty_in_stock"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.integer  "company_id"
    t.integer  "inquiry_id"
    t.integer  "sample_id"
    t.string   "secondary_contact"
    t.string   "name"
    t.integer  "number"
    t.string   "product"
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.string   "quantity_discount"
    t.string   "order_type"
    t.text     "note_for_sales"
    t.text     "note_for_lead"
    t.string   "lead_time"
    t.string   "ship_from"
    t.string   "ship_method"
    t.string   "country_of_origin"
    t.datetime "valid_till"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "samples", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.integer  "company_id"
    t.integer  "inquiry_id"
    t.integer  "quote_id"
    t.integer  "product_id"
    t.string   "name"
    t.string   "status"
    t.text     "note_to_receiver"
    t.text     "note_to_sales"
    t.string   "price"
    t.string   "lead_time"
    t.string   "street"
    t.string   "suite"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "shipping_method"
    t.boolean  "drop_ship"
    t.string   "custom_color"
    t.string   "custom_length"
    t.string   "custom_width"
    t.string   "custom_other"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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

end
