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

ActiveRecord::Schema.define(version: 20200227053518) do

  create_table "currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "sign_up_url"
    t.boolean  "signed",                 default: false
    t.float    "balance",     limit: 24, default: 0.0
    t.integer  "currency_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["currency_id"], name: "index_payees_on_currency_id", using: :btree
  end

  create_table "payouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "payment_id"
    t.float    "amount",               limit: 24
    t.text     "description",          limit: 65535
    t.string   "response_code"
    t.string   "response_description"
    t.integer  "payee_id"
    t.integer  "currency_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["currency_id"], name: "index_payouts_on_currency_id", using: :btree
    t.index ["payee_id"], name: "index_payouts_on_payee_id", using: :btree
  end

  add_foreign_key "payouts", "currencies"
  add_foreign_key "payouts", "payees"
end
