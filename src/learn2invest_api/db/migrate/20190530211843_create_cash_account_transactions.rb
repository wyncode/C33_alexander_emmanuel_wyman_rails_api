class CreateCashAccountTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_account_transactions do |t|
      t.integer :pennies_withdrawl
      t.integer :pennies_deposit
      t.integer :pennies_balance
      t.references :cash_account

      t.timestamps
    end
  end
end
