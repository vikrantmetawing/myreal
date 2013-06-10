class CreateStoriesses < ActiveRecord::Migration
  def change
    create_table :storiesses do |t|
      t.integer :storyid  NOT NULL auto_increment PRIMARY KEY
      t.string :name
      t.string :email
      t.integer :phone
      t.string :story

      t.timestamps
    end
  end
end
