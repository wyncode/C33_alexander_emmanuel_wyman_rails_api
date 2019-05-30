class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :value
      t.string :cities

      t.timestamps
    end
  end
end
