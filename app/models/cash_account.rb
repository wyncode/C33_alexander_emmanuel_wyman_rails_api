class CashAccount < ApplicationRecord
  belongs_to :customer
  has_many   :cash_account_transactions
end
