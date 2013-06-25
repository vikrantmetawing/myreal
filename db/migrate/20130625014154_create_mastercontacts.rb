class CreateMastercontacts < ActiveRecord::Migration
  def change
   create_table :mastercontacts ,:primary_key => :user_id do |t|
      t.string :content
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
