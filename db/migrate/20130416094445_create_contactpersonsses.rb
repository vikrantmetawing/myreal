class CreateContactpersonsses < ActiveRecord::Migration
  def change
    create_table :contactpersonsses do |t|
      t.integer :phone
      t.string :name
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
