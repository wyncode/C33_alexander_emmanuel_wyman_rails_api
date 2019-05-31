class ChangeCityZipNull < ActiveRecord::Migration[6.0]
  def change
    change_column :cities, :zip_codes_id, :integer, :null => true
  end
end
