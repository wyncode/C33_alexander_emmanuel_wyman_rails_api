class StockSale < ApplicationRecord
  belongs_to :sell_price
  belongs_to :buy_price
  belongs_to :stock
end
