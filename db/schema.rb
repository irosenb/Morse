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

ActiveRecord::Schema.define(version: 20141210053443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: true do |t|
    t.boolean  "open",       default: false
    t.string   "number"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sid"
    t.string   "token"
  end

  create_table "products", force: true do |t|
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "twilio_accounts", force: true do |t|
    t.string   "sid"
    t.string   "token"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conference_id"
  end

  add_index "twilio_accounts", ["conference_id"], name: "index_twilio_accounts_on_conference_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.integer  "hunt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.datetime "hunted_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "image"
  end

end
