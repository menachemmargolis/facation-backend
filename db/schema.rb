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

ActiveRecord::Schema.define(version: 2021_02_17_204949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companions", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.bigint "vacation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vacation_id"], name: "index_images_on_vacation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "profile_photo"
    t.string "forground_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacations", force: :cascade do |t|
    t.string "location"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "companion_id"
    t.index ["companion_id"], name: "index_vacations_on_companion_id"
    t.index ["user_id"], name: "index_vacations_on_user_id"
  end

  add_foreign_key "vacations", "companions"
end
