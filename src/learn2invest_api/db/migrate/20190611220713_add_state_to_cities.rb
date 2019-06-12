class AddStateToCities < ActiveRecord::Migration[6.0]
  def change
    t.references :state, null: false, foreign_key: true
    add_reference :uploads, :user, index: true

  end
end
