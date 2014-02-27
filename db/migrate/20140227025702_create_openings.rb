class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
    	t.datetime :date
    	t.datetime :time
    	t.string :instruction
    	t.integer :student_id

    	t.timestamps
    end
  end
end
