class Addstory < ActiveRecord::Migration
  def up
  end

	def change
	add_column :storis,:user_id,:integer
	end
  
  
  def down
  end
end
