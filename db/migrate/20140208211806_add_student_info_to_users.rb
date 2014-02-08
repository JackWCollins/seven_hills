class AddStudentInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone, :string
  	add_column :users, :age, :integer
  	add_column :users, :street_address, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  end
end
