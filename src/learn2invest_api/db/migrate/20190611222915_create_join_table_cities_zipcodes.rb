class CreateJoinTableCitiesZipcodes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :cities, :zipcodes do |t|
      t.index [:city_id, :zipcode_id]
    end
  end
end
