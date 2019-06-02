class ChangeBuyPriceStockSaleNull < ActiveRecord::Migration[6.0]
  def change
    change_column :buy_prices, :stock_sales_id, :integer, :null => true
  end
end
