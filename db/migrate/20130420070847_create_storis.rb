class CreateStoris < ActiveRecord::Migration
  def change
    create_table :storis do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :story
      t.string :image

      t.timestamps
    end
  end
end
