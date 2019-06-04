class ChangeSellPriceStockSaleNull < ActiveRecord::Migration[6.0]
  def change
    change_column :sell_prices, :stock_sales_id, :integer, :null => true
  end
end
