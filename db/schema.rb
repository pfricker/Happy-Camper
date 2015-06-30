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

ActiveRecord::Schema.define(version: 20150630022316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backpacks", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name",      null: false
    t.string  "brand"
    t.integer "capacity"
    t.string  "size"
    t.string  "condition"
    t.string  "gender"
  end

  add_index "backpacks", ["user_id"], name: "index_backpacks_on_user_id", using: :btree

  create_table "sleepingbags", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        null: false
    t.string   "brand"
    t.integer  "temp_rating"
    t.string   "size"
    t.string   "condition"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "fill"
  end

  add_index "sleepingbags", ["user_id"], name: "index_sleepingbags_on_user_id", using: :btree

  create_table "tents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       null: false
    t.string   "brand"
    t.string   "capacity"
    t.string   "use"
    t.string   "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tents", ["user_id"], name: "index_tents_on_user_id", using: :btree

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
    t.string   "username",                            null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
