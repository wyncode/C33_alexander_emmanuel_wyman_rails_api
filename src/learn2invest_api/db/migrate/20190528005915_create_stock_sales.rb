class CreateStockSales < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_sales do |t|
      t.references :stocks, null: false, foreign_key: true
      t.references :buy_prices, null: false, foreign_key: true
      t.references :sell_prices, null: false, foreign_key: true
      t.integer :shares 
      t.timestamps
    end
  end
end
