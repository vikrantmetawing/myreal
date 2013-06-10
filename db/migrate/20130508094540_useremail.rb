class Useremail < ActiveRecord::Migration
  def up
  end
  def change
	add_column :users,:email,:string
end

  def down
  end
end
