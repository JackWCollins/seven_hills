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

ActiveRecord::Schema.define(version: 20140302181742) do

  create_table "groups", force: true do |t|
    t.integer  "reservation_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "openings", force: true do |t|
    t.datetime "date"
    t.datetime "time"
    t.string   "instruction"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.datetime "reservation_date"
    t.datetime "reservation_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "instruction"
  end

  create_table "shifts", force: true do |t|
    t.string   "role"
    t.datetime "date"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "notes"
    t.string   "person"
    t.datetime "begin_time"
  end

  create_table "students", force: true do |t|
    t.string   "email"
    t.string   "phone"
    t.integer  "age"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "instruction"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "phone"
    t.integer  "age"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.boolean  "member",          default: false
    t.boolean  "admin",           default: false
  end

end
