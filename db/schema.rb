# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_08_145605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.bigint "vehicle_id_id"
    t.string "cities"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_id_id"], name: "index_drivers_on_vehicle_id_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string "load_type"
    t.integer "load_sum"
    t.string "cities"
    t.bigint "driver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_routes_on_driver_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "capacity"
    t.string "load_type"
    t.bigint "driver_id_id"
    t.boolean "owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id_id"], name: "index_vehicles_on_driver_id_id"
  end

  add_foreign_key "routes", "drivers"
end
