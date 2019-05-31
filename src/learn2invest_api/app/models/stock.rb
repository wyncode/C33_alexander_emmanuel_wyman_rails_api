class Stock < ApplicationRecord
  has_many :stock_sales
  belongs_to :financial_instrument
end
