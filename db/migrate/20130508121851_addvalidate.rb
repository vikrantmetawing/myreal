class Addvalidate < ActiveRecord::Migration
  def up
  end

  def change
  
	add_column :users,:validate,:boolean
  end
	
  def down
  end
end
