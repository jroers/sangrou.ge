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

ActiveRecord::Schema.define(version: 20160219172238) do

  create_table "donations", force: :cascade do |t|
    t.string   "abo"
    t.string   "rhb"
    t.string   "product_code"
    t.datetime "collection_date"
    t.datetime "expiration_date"
    t.integer  "heart_rate"
    t.string   "bp"
    t.decimal  "hemoglobin"
    t.boolean  "donation_accepted?"
    t.integer  "tech_id"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "donations", ["organization_id"], name: "index_donations_on_organization_id"
  add_index "donations", ["user_id"], name: "index_donations_on_user_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "email_domain"
    t.string   "logo"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "last"
    t.string   "first"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.date     "dob"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.boolean  "is_tech?"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
