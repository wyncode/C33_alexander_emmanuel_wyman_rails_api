class StockSale < ApplicationRecord
  has_one :sell_price
  has_one :buy_price
  has_one :stock
end
