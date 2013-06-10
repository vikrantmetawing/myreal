class CreateMasterstories < ActiveRecord::Migration
  def change
    create_table :masterstories ,:primary_key => :user_id do |t|
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
