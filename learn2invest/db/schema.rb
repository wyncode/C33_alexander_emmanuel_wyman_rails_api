# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_26_232229) do

  create_table "cash_account_transactions", force: :cascade do |t|
    t.integer "pennies_withdrawl"
    t.integer "pennies_deposit"
    t.integer "pennies_balance"
    t.integer "cash_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cash_account_id"], name: "index_cash_account_transactions_on_cash_account_id"
  end

  create_table "cash_accounts", force: :cascade do |t|
    t.string "cash_account_transaction"
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_cash_accounts_on_customer_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "zip_codes_id", null: false
    t.integer "customers_id", null: false
    t.integer "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customers_id"], name: "index_cities_on_customers_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
    t.index ["zip_codes_id"], name: "index_cities_on_zip_codes_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "value"
    t.integer "cities_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cities_id"], name: "index_states_on_cities_id"
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string "value"
    t.integer "cities_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cities_id"], name: "index_zipcodes_on_cities_id"
  end

  add_foreign_key "cash_accounts", "customers"
  add_foreign_key "cities", "customers", column: "customers_id"
  add_foreign_key "cities", "states"
  add_foreign_key "cities", "zip_codes", column: "zip_codes_id"
  add_foreign_key "states", "cities", column: "cities_id"
  add_foreign_key "zipcodes", "cities", column: "cities_id"
end
