class Addpro < ActiveRecord::Migration
  def up
  end
  
  def change
		add_column:properties, :contant,:string
	end

  def down
  end
end
