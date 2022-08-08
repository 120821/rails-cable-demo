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

ActiveRecord::Schema.define(version: 20220804091145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articals", force: :cascade do |t|
    t.text     "content"
    t.string   "titile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string "url"
    t.string "edit_url"
    t.string "category"
    t.string "title"
    t.text   "content"
  end

  create_table "china_fortunes", force: :cascade do |t|
    t.integer  "year"
    t.string   "company"
    t.integer  "revenue"
    t.integer  "profit"
    t.integer  "asset"
    t.integer  "equity"
    t.integer  "employee"
    t.string   "country"
    t.string   "industry"
    t.integer  "per_capita_profit"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "per_two"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "fortunes", force: :cascade do |t|
    t.string   "company"
    t.integer  "revenue"
    t.integer  "profit"
    t.integer  "asset"
    t.integer  "equity"
    t.string   "ceo"
    t.integer  "employee"
    t.string   "country"
    t.string   "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "my_blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_by_goods", force: :cascade do |t|
    t.integer  "country"
    t.integer  "user_name_id"
    t.integer  "province"
    t.integer  "city"
    t.integer  "district"
    t.integer  "sum"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "order_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "region_id"
  end

  create_table "user_names", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_name_id"
  end

end
