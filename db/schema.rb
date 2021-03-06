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

ActiveRecord::Schema.define(version: 20140205012106) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avatars", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organizer_name"
    t.text     "organizer_description"
    t.string   "venue_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "region"
    t.integer  "admin_id"
  end

  create_table "participants", force: true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "team_id"
  end

  create_table "prizes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sponsor_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_network_links", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "network",    null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "social_network_links", ["user_id", "network"], name: "index_social_network_links_on_user_id_and_network", unique: true

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stack_components", force: true do |t|
    t.string   "name",       null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stack_components", ["name", "team_id"], name: "index_stack_components_on_name_and_team_id", unique: true

  create_table "swags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sponsor_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_id"
    t.text     "description"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "description"
    t.string   "title"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
