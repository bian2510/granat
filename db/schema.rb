# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_26_011415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "province"
    t.string "city"
    t.string "municipality"
    t.string "main_street"
    t.string "secondary_street"
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_addresses_on_property_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "amenities", force: :cascade do |t|
    t.boolean "bbq"
    t.boolean "sport_zones"
    t.boolean "gym"
    t.boolean "pool"
    t.boolean "comunal_room"
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_amenities_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "kind"
    t.string "operation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_properties_on_admin_id"
  end

  create_table "property_features", force: :cascade do |t|
    t.float "total_area"
    t.float "build_area"
    t.integer "year_old"
    t.integer "rooms"
    t.integer "bathrooms"
    t.integer "social_bathrooms"
    t.integer "parking"
    t.integer "trunk"
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_property_features_on_property_id"
  end

  add_foreign_key "addresses", "properties"
  add_foreign_key "amenities", "properties"
  add_foreign_key "properties", "admins"
  add_foreign_key "property_features", "properties"
end
