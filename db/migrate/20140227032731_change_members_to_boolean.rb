class ChangeMembersToBoolean < ActiveRecord::Migration
  def change
  	remove_column :users, :member 

  	add_column :users, :member, :boolean
  end
end
