class AddInstructionToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :instruction, :string
  end
end
