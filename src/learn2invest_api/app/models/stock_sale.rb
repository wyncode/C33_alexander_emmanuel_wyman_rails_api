class StockSale < ApplicationRecord
  belongs_to :stock
  belongs_to :buy_price
  belongs_to :sell_price
end
