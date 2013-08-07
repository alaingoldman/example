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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130726162554) do

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.text     "email"
    t.date     "accepted_at"
    t.text     "invite_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "invitations", ["email"], :name => "index_invitations_on_email", :unique => true

  create_table "photos", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "user_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "condition"
    t.string   "ship_method"
    t.decimal  "ship_price"
    t.integer  "quantity"
    t.integer  "user_id"
  end

  create_table "requests", :force => true do |t|
    t.text     "email"
    t.boolean  "activated",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "requests", ["email"], :name => "index_requests_on_email", :unique => true

  create_table "transactions", :force => true do |t|
    t.string   "debit_uri"
    t.string   "credit_uri"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "product_id"
    t.decimal  "price"
    t.decimal  "ship_price"
    t.string   "ship_method"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "email_activation_token", :default => false
    t.string   "email_token"
    t.string   "name"
    t.boolean  "admin",                  :default => false
    t.string   "customer_uri"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
