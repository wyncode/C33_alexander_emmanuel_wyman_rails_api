class ChangeStockStockSalesNull < ActiveRecord::Migration[6.0]
  def change
    change_column :stocks, :stock_sales_id, :integer, :null => true
  end
end
