class CreateMasterstories < ActiveRecord::Migration
  def change
   create_table :masterstories ,:primary_key => :user_id do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
