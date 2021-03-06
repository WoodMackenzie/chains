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

ActiveRecord::Schema.define(version: 20140630123348) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "active_date"
  end

  create_table "commodities", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_granularities", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measure_types", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "names", force: true do |t|
    t.integer  "nameable_id"
    t.string   "nameable_type"
    t.integer  "user_id"
    t.date     "active_date"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "processing_units", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "unit_type_id"
    t.integer  "location_granularity_id"
  end

  create_table "project_categories", force: true do |t|
    t.integer  "user_id"
    t.string   "category_type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "project_detail_dates", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "project_category_id"
    t.date     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_detail_numericals", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "project_category_id"
    t.float    "value"
    t.integer  "units_of_measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_detail_strings", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "project_category_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.string   "projectable_type"
    t.integer  "projectable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_assignments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "holder_id"
    t.string   "holder_type"
    t.integer  "subject_id"
    t.string   "subject_type"
    t.date     "active_date"
    t.float    "share"
    t.integer  "user_id"
  end

  create_table "roles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "user_id"
  end

  create_table "throughput_metrics", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "throughputs", force: true do |t|
    t.integer  "user_id"
    t.integer  "processing_unit_id"
    t.integer  "metric_id"
    t.integer  "amount_unit_id"
    t.integer  "time_unit_id"
    t.integer  "commodity_id"
    t.date     "active_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "value"
  end

  create_table "unit_types", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units_of_measures", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.integer  "measure_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
