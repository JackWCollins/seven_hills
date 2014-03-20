class AddConfirmedToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :confirmed, :boolean, default: false
  end
end
