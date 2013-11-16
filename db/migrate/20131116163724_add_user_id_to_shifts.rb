class AddUserIdToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :user_id, :integer
  end
end
