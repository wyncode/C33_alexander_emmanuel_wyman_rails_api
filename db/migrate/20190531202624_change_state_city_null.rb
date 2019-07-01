class ChangeStateCityNull < ActiveRecord::Migration[6.0]
  def change
    change_column :states, :cities_id, :integer, :null => true
  end
end
