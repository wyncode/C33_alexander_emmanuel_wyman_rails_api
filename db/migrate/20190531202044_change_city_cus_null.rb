class ChangeCityCusNull < ActiveRecord::Migration[6.0]
  def change
    change_column :cities, :customers_id, :integer, :null => true
  end
end
