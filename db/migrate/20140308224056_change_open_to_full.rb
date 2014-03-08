class ChangeOpenToFull < ActiveRecord::Migration
  def change
  	remove_column :openings, :open, :boolean

  	add_column :openings, :reserved, :boolean, default: false
  end
end
