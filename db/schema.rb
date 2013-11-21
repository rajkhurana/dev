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

ActiveRecord::Schema.define(version: 20131115062724) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "ssn"
    t.text     "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "phonenumber"
    t.string   "email"
    t.date     "doe"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "ssn"
    t.text     "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.date     "dob"
    t.string   "phonenumber"
    t.string   "email"
    t.integer  "department"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "jobtitle"
    t.string   "jobdesc"
    t.float    "payrate"
    t.boolean  "issalaried"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs_users", force: true do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payrolls", force: true do |t|
    t.integer  "user_id"
    t.date     "startday"
    t.date     "endday"
    t.float    "hoursworked"
    t.float    "grosspay"
    t.float    "deductions"
    t.float    "netpay"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  create_table "role_users", force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "cust_id"
    t.string   "user_type"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
