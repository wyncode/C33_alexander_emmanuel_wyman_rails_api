class Customer < ApplicationRecord
  has_one :cash_account
  has_many :financial_instruments
end
