class CreateCashAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_accounts do |t|
      t.string :cash_account_transaction
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
