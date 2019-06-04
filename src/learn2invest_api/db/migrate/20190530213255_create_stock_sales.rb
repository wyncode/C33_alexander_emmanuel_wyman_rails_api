class CreateStockSales < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_sales do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :buy_price, null: false, foreign_key: true
      t.references :sell_price, null: false, foreign_key: true
      t.integer :shares 

      t.timestamps
    end
  end
end
