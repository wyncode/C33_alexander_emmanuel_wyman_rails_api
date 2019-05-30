class CreateSellPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_prices do |t|
      t.string :pennies
      t.string :stock_sales

      t.timestamps
    end
  end
end
