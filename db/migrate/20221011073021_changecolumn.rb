class Changecolumn < ActiveRecord::Migration[7.0]
  def change
  	rename_column :friends, :lastname, :last_name
  end
end
