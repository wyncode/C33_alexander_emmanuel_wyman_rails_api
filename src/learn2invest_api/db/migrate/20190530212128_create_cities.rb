class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :zip_codes
      t.string :customers
      t.string :state

      t.timestamps
    end
  end
end
