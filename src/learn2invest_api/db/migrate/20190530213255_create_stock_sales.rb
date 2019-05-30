class CreateStockSales < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_sales do |t|
      t.string :stock
      t.string :buy_price
      t.string :sale_price
      t.string :shares

      t.timestamps
    end
  end
end
