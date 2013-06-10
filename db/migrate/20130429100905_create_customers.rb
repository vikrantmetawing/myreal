class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.string :primary
      t.string :key
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
