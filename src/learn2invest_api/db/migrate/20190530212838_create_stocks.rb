class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :stock_sales
      t.string :financial_instrument

      t.timestamps
    end
  end
end
