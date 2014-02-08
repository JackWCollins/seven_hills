class RemoveTypeFromStudents < ActiveRecord::Migration
  def change
  	remove_column :students, :type
  end
end
