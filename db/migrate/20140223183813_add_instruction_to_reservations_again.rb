class AddInstructionToReservationsAgain < ActiveRecord::Migration
  def change
  	add_column :reservations, :instruction, :string
  end
end
