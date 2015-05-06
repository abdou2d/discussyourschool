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

ActiveRecord::Schema.define(version: 20150505233829) do

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mec_code"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
  end

  add_index "schools", ["email"], name: "index_schools_on_email", unique: true
  add_index "schools", ["name"], name: "index_schools_on_name", unique: true

  create_table "students", force: :cascade do |t|
    t.string   "school_name"
    t.string   "name"
    t.string   "birthday"
    t.string   "grade"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["name"], name: "index_students_on_name", unique: true

end
