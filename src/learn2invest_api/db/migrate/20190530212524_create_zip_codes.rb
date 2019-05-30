class CreateZipCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :zip_codes do |t|
      t.string :value
      t.string :cities

      t.timestamps
    end
  end
end
