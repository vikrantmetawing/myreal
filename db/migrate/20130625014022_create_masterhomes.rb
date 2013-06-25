class CreateMasterhomes < ActiveRecord::Migration
  def change
    create_table :masterhomes ,:primary_key => :user_id do |t|
      t.string :address
      t.string :c_img_1
      t.string :c_img_2
      t.string :c_name
      t.string :logo
      t.integer :phone
      t.string :slider_img_1
      t.string :slider_img_2
      t.string :slider_img_3
      t.integer :user_id

      t.timestamps
    end
  end
end
