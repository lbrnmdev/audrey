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

ActiveRecord::Schema.define(version: 20170523094926) do

  create_table "clients", force: :cascade do |t|
    t.string   "lastname"
    t.string   "other_names"
    t.string   "address"
    t.string   "telephone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "insurers", force: :cascade do |t|
    t.string   "name"
    t.string   "full_legal_name"
    t.string   "address"
    t.string   "email_address"
    t.string   "phone_number"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_insurers_on_user_id"
  end

  create_table "policies", force: :cascade do |t|
    t.string   "number"
    t.string   "policy_type"
    t.integer  "status",      default: 0
    t.date     "issue_date"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "premium"
    t.decimal  "commission"
    t.decimal  "discount"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "client_id"
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.index ["client_id"], name: "index_policies_on_client_id"
    t.index ["number", "user_id"], name: "index_policies_on_number_and_user_id", unique: true
    t.index ["user_id"], name: "index_policies_on_user_id"
    t.index ["vehicle_id"], name: "index_policies_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "registration_no"
    t.string   "chassis_no"
    t.string   "make"
    t.string   "model"
    t.integer  "year_of_manufacture"
    t.string   "cubic_capacity"
    t.integer  "seating_capacity"
    t.string   "body_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["chassis_no"], name: "index_vehicles_on_chassis_no"
    t.index ["client_id"], name: "index_vehicles_on_client_id"
    t.index ["registration_no"], name: "index_vehicles_on_registration_no"
  end

end
