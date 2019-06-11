# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.destroy_all
State.destroy_all
City.destroy_all
ZipCode.destroy_all
CashAccount.destroy_all
Stock.destroy_all
StockSale.destroy_all
SellPrice.destroy_all
BuyPrice.destroy_all

  #create Admin
  state = State.create!(
    value: 'FL')
  city = City.create!(
    name: 'Little Town',
    state: state)

  customer = Customer.create!(
  first_name:           'Jennifer',
  last_name:            'Smith',
  password:             'password',
  email:                'anon@anon.com',
  mobile:               '999-999-9999',
  street1:              '99 NW 99th AVE',
  city:                 city)

10.times do

  #create State
  state = State.create!(
    value:                Faker::Address.state_abbr)

  #create ZipCode
  zipcode = ZipCode.create!(
    value:                Faker::Address.zip_code)

  #create City with its State and ZipCode
  city = City.create!(
    name:                 Faker::Address.city_prefix + Faker::Address.city_suffix,
    state:                state,
    zip_codes_id:         zipcode.id)

  #assign City to the ZipCode 
  zipcode.cities_id = city.id
  zipcode.save

  #create Customer with personal info and city
  customer = Customer.create!(
  first_name:           Faker::Name.first_name,
  last_name:            Faker::Name.last_name,
  password:             'password',
  email:                Faker::Internet.email,
  mobile:               Faker::PhoneNumber.phone_number,
  street1:              Faker::Address.street_address,
  city:                 city)
     
            ##END OF CUSTOMER INFO##

  #create Cash Account that belongs to a Customer
  cash_account = CashAccount.create!( customer: customer )

  #create Financial Instrument that belongs to a Customer
  financial_instrument = FinancialInstrument.create!( customer_id: customer.id )

  #create a Stock with Financial Instrument and Stock Sale
  stock = Stock.create!(
  symbol:               'NASDAQ',
  financial_instrument: financial_instrument)

  #add Stock to Financial Instrument
  financial_instrument.stocks_id = stock.id
  financial_instrument.save

  #create Buy Price with pennies value $100 - $250 in pennies
  buy_price = BuyPrice.create!( pennies: rand(10_000..25_000))

  #create Sell Price with pennies value $100 - $250 in pennies
  sell_price = SellPrice.create!( pennies: rand(10_000..25_000))

  #add StockSale with Stock, BuyPrice, and SellPrice 
  stock_sale = StockSale.create!(
    stock:             stock,
    buy_price_id:         buy_price.id,
    sell_price_id:        sell_price.id,
    shares:            rand(1..20))

  #add Stock Sale to Stock
  stock.stock_sales_id = stock_sale
  stock.save


end

puts "created #{Customer.count} customers"
