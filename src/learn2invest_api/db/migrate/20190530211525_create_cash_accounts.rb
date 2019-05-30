class CreateCashAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_accounts do |t|
      t.string :cash_account_transactions
      t.string :customer

      t.timestamps
    end
  end
end
