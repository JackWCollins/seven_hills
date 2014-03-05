class Opening < ActiveRecord::Base

	validates_presence_of :date, :time, :instruction

	INSTRUCTION_TYPES = ["Tandem", "Instructor Assisted Deployment"]

	def start_time
		date
	end

	def reserve_opening

	end
end