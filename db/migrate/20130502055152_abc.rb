class Abc < ActiveRecord::Migration
  def up
  end
  
  def change
	 add_column :users,:my_properties,:string
  end

  def down
  end
end
