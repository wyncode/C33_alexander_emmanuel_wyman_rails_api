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

ActiveRecord::Schema.define(version: 2019_06_02_170423) do

  create_table "buy_prices", force: :cascade do |t|
    t.integer "pennies"
    t.integer "stock_sales_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_sales_id"], name: "index_buy_prices_on_stock_sales_id"
  end

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
    t.integer "zip_codes_id"
    t.integer "customers_id"
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
    t.string "password_digest"
    t.string "mobile"
    t.string "street1"
    t.string "street2"
    t.integer "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_customers_on_city_id"
  end

  create_table "financial_instruments", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "stocks_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_financial_instruments_on_customer_id"
    t.index ["stocks_id"], name: "index_financial_instruments_on_stocks_id"
  end

  create_table "sell_prices", force: :cascade do |t|
    t.integer "pennies"
    t.integer "stock_sales_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_sales_id"], name: "index_sell_prices_on_stock_sales_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "value"
    t.integer "cities_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cities_id"], name: "index_states_on_cities_id"
  end

  create_table "stock_sales", force: :cascade do |t|
    t.integer "stock_id", null: false
    t.integer "buy_price_id", null: false
    t.integer "sell_price_id", null: false
    t.integer "shares"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buy_price_id"], name: "index_stock_sales_on_buy_price_id"
    t.index ["sell_price_id"], name: "index_stock_sales_on_sell_price_id"
    t.index ["stock_id"], name: "index_stock_sales_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.integer "stock_sales_id"
    t.integer "financial_instrument_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_instrument_id"], name: "index_stocks_on_financial_instrument_id"
    t.index ["stock_sales_id"], name: "index_stocks_on_stock_sales_id"
  end

  create_table "zip_codes", force: :cascade do |t|
    t.string "value"
    t.integer "cities_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cities_id"], name: "index_zip_codes_on_cities_id"
  end

  add_foreign_key "buy_prices", "stock_sales", column: "stock_sales_id"
  add_foreign_key "cash_accounts", "customers"
  add_foreign_key "cities", "customers", column: "customers_id"
  add_foreign_key "cities", "states"
  add_foreign_key "cities", "zip_codes", column: "zip_codes_id"
  add_foreign_key "financial_instruments", "customers"
  add_foreign_key "financial_instruments", "stocks", column: "stocks_id"
  add_foreign_key "sell_prices", "stock_sales", column: "stock_sales_id"
  add_foreign_key "states", "cities", column: "cities_id"
  add_foreign_key "stock_sales", "buy_prices"
  add_foreign_key "stock_sales", "sell_prices"
  add_foreign_key "stock_sales", "stocks"
  add_foreign_key "stocks", "financial_instruments"
  add_foreign_key "stocks", "stock_sales", column: "stock_sales_id"
  add_foreign_key "zip_codes", "cities", column: "cities_id"
end
