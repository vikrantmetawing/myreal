class CreateMusers < ActiveRecord::Migration
  def change
    create_table :musers ,:primary_key => :master_user_id do |t|
      t.string :master_email
      t.integer :master_user_id
      t.string :password
      t.string :shop_name
      t.boolean :validate

      t.timestamps
    end
	add_index :musers, [:shop_name], :unique => true
  end
end
