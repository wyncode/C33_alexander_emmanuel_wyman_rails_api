class CreateCashAccountTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_account_transactions do |t|
      t.string :pennies_withdrawl
      t.string :pennies_deposit
      t.string :pennies_balance
      t.string :cash_account

      t.timestamps
    end
  end
end
