class ChangeZipCityNull < ActiveRecord::Migration[6.0]
  def change
    change_column :zip_codes, :cities_id, :integer, :null => true
  end
end
