class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :instruction
    	t.string :contact_name
    	t.string :contact_email
    	t.integer :size

    	t.timestamps
    end
  end
end
