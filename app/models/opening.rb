class Opening < ActiveRecord::Base
	belongs_to :student

	validates_presence_of :date, :time, :instruction

	INSTRUCTION_TYPES = ["Tandem", "Instructor Assisted Deployment"]
end