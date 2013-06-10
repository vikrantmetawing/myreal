class CreateMasterhomes < ActiveRecord::Migration
  def change
    create_table :masterhomes ,:primary_key => :user_id do |t|
      t.integer :user_id
      t.string :c_name
      t.integer :phone
      t.string :address
      t.string :logo
      t.string :slider_img_1
      t.string :slider_img_2
      t.string :slider_img_3
      t.string :c_img_1
      t.string :c_img_2

      t.timestamps
    end
  end
end
