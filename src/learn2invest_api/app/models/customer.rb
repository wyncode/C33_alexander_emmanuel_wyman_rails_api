class Customer < ApplicationRecord
  has_secure_password
  belongs_to :cash_account
  has_many :financial_instruments
end
