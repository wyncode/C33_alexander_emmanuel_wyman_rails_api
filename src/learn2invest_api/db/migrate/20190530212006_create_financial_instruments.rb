class CreateFinancialInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_instruments do |t|
      t.string :customer
      t.string :stocks

      t.timestamps
    end
  end
end
