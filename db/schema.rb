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

ActiveRecord::Schema.define(version: 20170531015646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "place"
    t.float "amount"
    t.date "date"
    t.bigint "users_id"
    t.bigint "house_holds_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_expenses_on_date"
    t.index ["house_holds_id"], name: "index_expenses_on_house_holds_id"
    t.index ["users_id"], name: "index_expenses_on_users_id"
  end

  create_table "house_holds", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.bigint "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_house_holds_on_master_id"
    t.index ["name"], name: "index_house_holds_on_name"
  end

  create_table "house_holds_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "house_hold_id"
    t.index ["house_hold_id"], name: "index_house_holds_users_on_house_hold_id"
    t.index ["user_id"], name: "index_house_holds_users_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "company"
    t.date "due_date"
    t.boolean "is_paid", default: false
    t.bigint "asignee_id"
    t.bigint "house_holds_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignee_id"], name: "index_services_on_asignee_id"
    t.index ["house_holds_id"], name: "index_services_on_house_holds_id"
    t.index ["is_paid"], name: "index_services_on_is_paid"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
