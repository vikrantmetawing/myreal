class Addcol < ActiveRecord::Migration
  def up
  end
  
  def change
	add_column :masterhomes,:company_img,:string
  end

  def down
  end
end
