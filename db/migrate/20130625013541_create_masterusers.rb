class CreateMasterusers < ActiveRecord::Migration
  def change
    create_table :masterusers do |t|
      t.string :master_email
      t.integer :master_user_id
      t.string :password
      t.string :shop_name
      t.boolean :validate

      t.timestamps
    end
  end
end
