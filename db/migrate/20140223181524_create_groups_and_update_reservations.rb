class CreateGroupsAndUpdateReservations < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.integer :reservation_id
    	t.integer :student_id

    	t.timestamps
    end

    remove_column :reservations, :student_id, :integer
  end
end
