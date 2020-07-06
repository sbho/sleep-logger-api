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

ActiveRecord::Schema.define(version: 2020_07_06_230204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evening_entries", force: :cascade do |t|
    t.integer "caffeine_morning"
    t.integer "caffeine_afternoon"
    t.integer "caffeine_evening"
    t.boolean "nap_morning"
    t.boolean "nap_afternoon"
    t.boolean "nap_evening"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_evening_entries_on_user_id"
  end

  create_table "morning_entries", force: :cascade do |t|
    t.datetime "bed_time"
    t.datetime "wake_up_time"
    t.integer "ease_of_sleep"
    t.integer "hours_of_sleep"
    t.integer "morning_feeling"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_morning_entries_on_user_id"
  end

  create_table "tips", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usertips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "evening_entries", "users"
  add_foreign_key "morning_entries", "users"
end
