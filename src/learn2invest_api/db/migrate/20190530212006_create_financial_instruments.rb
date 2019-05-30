class CreateFinancialInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_instruments do |t|
      t.references :customers, null: false, foreign_key: true
      t.references :stocks, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
