class CreateMasterusers < ActiveRecord::Migration
  def change
    create_table :masterusers do |t|
      t.integer :master_user_id
      t.string :shop_name
      t.string :password
      t.string :master_email
      t.boolean :validate

      t.timestamps
    end
  end
end
