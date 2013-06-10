class CreatePropertylists < ActiveRecord::Migration
  def change
    create_table :propertylists do |t|
      t.integer :user_id
      t.integer :property_id

      t.timestamps
    end
  end
end
