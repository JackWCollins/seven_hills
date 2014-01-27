class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :type
    	t.string :name
    	t.string :email
    	t.string :phone
    	t.integer :age
    	t.string :street_address
    	t.string :city
    	t.string :state
    	t.text :notes

    	t.timestamps
    end
  end
end
