class AddInstructionToReservations < ActiveRecord::Migration
  def change
  	remove_column :reservations, :group_id, :integer
  	drop_table :groups
  	add_column :reservations, :user_id, :integer
  end
end
