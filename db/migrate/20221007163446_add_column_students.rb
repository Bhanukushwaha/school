class AddColumnStudents < ActiveRecord::Migration[7.0]
  def change
  	add_column :students, :start_date, :datetime
  	add_column :students, :end_date, :datetime 
  end
end
