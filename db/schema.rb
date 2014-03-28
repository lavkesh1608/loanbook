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

ActiveRecord::Schema.define(version: 20140312103048) do

  create_table "book_requests", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "date_of_request"
    t.string   "estimated_delivery_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lander_book_id"
  end

  create_table "book_responses", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "return_date"
    t.string   "delivered_date"
    t.string   "status"
    t.integer  "borrower_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_request_id"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "tag"
    t.string   "description"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "book_image_file_name"
    t.string   "book_image_content_type"
    t.integer  "book_image_file_size"
    t.datetime "book_image_updated_at"
    t.integer  "category_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fbusers", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "not_by"
    t.string   "not_msg"
    t.integer  "not_to"
    t.string   "status"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "shipping_address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "password"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "width"
    t.string   "height"
    t.string   "marginleft"
    t.string   "marginright"
  end

end
