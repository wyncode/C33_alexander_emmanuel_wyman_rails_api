class ChangeFinancialInstrumentStockNull < ActiveRecord::Migration[6.0]
  def change
    change_column :financial_instruments, :stocks_id, :integer, :null => true
  end
end
