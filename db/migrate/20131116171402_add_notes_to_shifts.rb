class AddNotesToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :notes, :text
  end
end
