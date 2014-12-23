class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile_no
      t.string :string
      t.string :email

      t.timestamps
    end
  end
end
