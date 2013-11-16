class ChangeStartTimeToBeginTime < ActiveRecord::Migration
  def change
  	remove_column :shifts, :start_time
  	add_column :shifts, :begin_time, :datetime
  end
end
