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

ActiveRecord::Schema.define(version: 20180805220858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genders", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.bigint "survivor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_id"], name: "index_locations_on_survivor_id"
  end

  create_table "report_survivors", force: :cascade do |t|
    t.integer "abd_report"
    t.boolean "has_abd"
    t.bigint "survivor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_id"], name: "index_report_survivors_on_survivor_id"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gender_id"
    t.index ["gender_id"], name: "index_survivors_on_gender_id"
  end

  add_foreign_key "locations", "survivors"
  add_foreign_key "report_survivors", "survivors"
  add_foreign_key "survivors", "genders"
end
