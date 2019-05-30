class Stock < ApplicationRecord
  has_many :stock_sales
  has_one :financial_instrument
end
