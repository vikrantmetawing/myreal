class Addc < ActiveRecord::Migration
  def up
  end

   def change
	add_column :masterhomes,:company_detail,:string
  end
  def down
  end
end
