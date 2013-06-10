class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :story

      t.timestamps
    end
  end
end
