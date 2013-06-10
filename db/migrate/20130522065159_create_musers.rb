class CreateMusers < ActiveRecord::Migration
  def change
    create_table :musers ,:primary_key => :master_user_id do |t|
      t.integer :master_user_id
      t.string :shop_name
      t.string :password
      t.string :master_email
      t.boolean :validate

      t.timestamps
    end
	add_index :musers, [:shop_name], :unique => true
  end
end
