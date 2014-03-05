class AddOpenToOpenings < ActiveRecord::Migration
  def change
  	add_column :openings, :open, :boolean
  end
end
