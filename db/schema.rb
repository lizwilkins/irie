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

ActiveRecord::Schema.define(:version => 20130412181952) do

  create_table "drivers", :force => true do |t|
    t.string   "supervisor"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "passengers", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "rider_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "riders", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "balance",    :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "routes", :force => true do |t|
    t.string   "number"
    t.string   "origin"
    t.string   "destination"
    t.string   "path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "trips", :force => true do |t|
    t.integer  "van_id"
    t.integer  "driver_id"
    t.integer  "route_id"
    t.datetime "departure"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "roles",           :default => "--- []"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "vans", :force => true do |t|
    t.string   "designation"
    t.integer  "capacity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
