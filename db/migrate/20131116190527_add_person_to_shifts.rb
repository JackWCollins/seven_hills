class AddPersonToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :person, :string
  end
end
