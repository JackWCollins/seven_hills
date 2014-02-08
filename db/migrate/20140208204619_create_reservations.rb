class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.belongs_to :group
    	t.belongs_to :student
    	t.datetime :reservation_date
    	t.datetime :reservation_time

    	t.timestamps
    end
  end
end
