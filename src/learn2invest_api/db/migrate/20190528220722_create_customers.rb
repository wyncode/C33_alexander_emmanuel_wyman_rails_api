class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :mobile
      t.string :street1
      t.string :street2
      t.string :city

      t.timestamps
    end
  end
end
