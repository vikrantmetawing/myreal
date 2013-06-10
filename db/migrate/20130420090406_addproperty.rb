class Addproperty < ActiveRecord::Migration
  def up
  end

	def change
		add_column:properties, :sub_property_type,:string
	end
  def down
  end
end
