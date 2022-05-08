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

ActiveRecord::Schema.define(version: 2022_05_06_123555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coping_lists", force: :cascade do |t|
    t.string "list_name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coping_lists_on_user_id"
  end

  create_table "copings", force: :cascade do |t|
    t.bigint "coping_list_id", null: false
    t.string "coping_name", null: false
    t.integer "cost_amount"
    t.integer "time_amount"
    t.string "emoji", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coping_list_id"], name: "index_copings_on_coping_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "coping_lists", "users"
  add_foreign_key "copings", "coping_lists"
end
