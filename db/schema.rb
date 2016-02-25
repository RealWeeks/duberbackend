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

ActiveRecord::Schema.define(version: 20160225153939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "description"
    t.string   "size"
    t.string   "note"
    t.string   "url"
    t.integer  "rating"
    t.integer  "walker_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree
  add_index "dogs", ["walker_id"], name: "index_dogs_on_walker_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.string   "address",         null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "description",     null: false
    t.string   "url",             null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  create_table "walkers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "description"
    t.string   "url"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "dogs", "users"
  add_foreign_key "dogs", "walkers"
end
