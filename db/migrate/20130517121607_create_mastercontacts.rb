class CreateMastercontacts < ActiveRecord::Migration
  def change
    create_table :mastercontacts ,:primary_key => :user_id do |t|
      t.integer :user_id
      t.string :content
      t.string :email

      t.timestamps
    end
  end
end
