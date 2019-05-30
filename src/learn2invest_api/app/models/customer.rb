class Customer < ApplicationRecord
  has_secure_password
  has_one :cash_account
  has_many :financial_instruments
end
