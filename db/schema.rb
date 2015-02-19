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

ActiveRecord::Schema.define(version: 20150218140329) do

  create_table "accidents", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "dateofbirth"
    t.string   "gender"
    t.integer  "policy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "taxcode"
    t.string   "weight"
    t.string   "height"
    t.string   "occupation"
    t.string   "smoker"
    t.string   "typeofsmoke"
    t.string   "smokequantity"
    t.date     "stopdate"
    t.string   "alcohol"
    t.string   "typeofalcohol"
    t.string   "alcoholquantity"
    t.string   "nrflights"
    t.string   "motorkm"
    t.string   "flightnonpassenger"
    t.string   "flightnonscheduled"
    t.string   "travelabroad"
    t.string   "wintersport"
    t.string   "scubadiving"
    t.string   "mountainering"
    t.string   "potholing"
    t.string   "hanggliding"
    t.string   "horseriding"
    t.string   "runningrace"
    t.string   "scooter"
    t.string   "increasedrisk"
    t.string   "defectivehearing"
    t.string   "medicaltreatment"
    t.text     "yesdetails"
    t.text     "accidents"
    t.string   "insured"
    t.text     "yesinsured"
    t.string   "declinedcoverage"
    t.text     "yesdeclined"
    t.string   "confmaxsum"
    t.string   "benefic"
    t.string   "signass"
    t.date     "dateass"
    t.string   "signph"
    t.date     "dateph"
    t.text     "addinfo"
    t.date     "insurancestart"
    t.date     "insuranceend"
    t.string   "phrelation"
  end

  create_table "fvplants", force: true do |t|
    t.string   "gps"
    t.string   "address"
    t.string   "yearofconstruction"
    t.string   "fvtypology"
    t.integer  "policy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "policies", force: true do |t|
    t.string   "policytype"
    t.integer  "policyholder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "insurancestart"
    t.date     "insuranceend"
  end

  create_table "policyholders", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "vatnumber"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
