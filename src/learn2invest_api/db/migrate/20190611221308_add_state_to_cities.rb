class AddStateToCities < ActiveRecord::Migration[6.0]
  def change
    add_reference :cities, :state, null: false, foreign_key: true
  end
end
