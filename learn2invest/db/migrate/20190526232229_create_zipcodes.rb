class CreateZipcodes < ActiveRecord::Migration[6.0]
  def change
    create_table :zipcodes do |t|
      t.string :value
      t.references :cities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
