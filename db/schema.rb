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

ActiveRecord::Schema.define(version: 20150313161216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "dpcapacity"
    t.datetime "online_date"
  end

  add_index "stations", ["dpcapacity"], name: "index_stations_on_dpcapacity", using: :btree
  add_index "stations", ["latitude"], name: "index_stations_on_latitude", using: :btree
  add_index "stations", ["longitude"], name: "index_stations_on_longitude", using: :btree
  add_index "stations", ["name"], name: "index_stations_on_name", using: :btree
  add_index "stations", ["online_date"], name: "index_stations_on_online_date", using: :btree

  create_table "trips", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "stop_time"
    t.integer  "trip_duration"
    t.integer  "bike_id"
    t.integer  "from_station_id"
    t.string   "from_station_name"
    t.integer  "to_station_id"
    t.string   "to_station_name"
    t.string   "user_type"
    t.string   "gender"
    t.integer  "birth_year"
  end

  add_index "trips", ["bike_id"], name: "index_trips_on_bike_id", using: :btree
  add_index "trips", ["birth_year"], name: "index_trips_on_birth_year", using: :btree
  add_index "trips", ["from_station_id"], name: "index_trips_on_from_station_id", using: :btree
  add_index "trips", ["from_station_name"], name: "index_trips_on_from_station_name", using: :btree
  add_index "trips", ["gender"], name: "index_trips_on_gender", using: :btree
  add_index "trips", ["start_time"], name: "index_trips_on_start_time", using: :btree
  add_index "trips", ["stop_time"], name: "index_trips_on_stop_time", using: :btree
  add_index "trips", ["to_station_id"], name: "index_trips_on_to_station_id", using: :btree
  add_index "trips", ["to_station_name"], name: "index_trips_on_to_station_name", using: :btree
  add_index "trips", ["trip_duration"], name: "index_trips_on_trip_duration", using: :btree
  add_index "trips", ["user_type"], name: "index_trips_on_user_type", using: :btree

end
