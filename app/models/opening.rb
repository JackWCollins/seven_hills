class Opening < ActiveRecord::Base

	validates_presence_of :date, :time, :instruction

	INSTRUCTION_TYPES = ["Tandem", "Instructor Assisted Deployment"]

	def start_time
		date
	end

	def reserve_opening

	end

	def self.search_by_date(search_date)
		return [] if search_date.blank?
		start_of_day = DateTime.strptime(search_date, "%m/%d/%Y").beginning_of_day
		end_of_day = DateTime.strptime(search_date, "%m/%d/%Y").end_of_day
		Opening.where("date >= ? AND date <= ?", start_of_day, end_of_day)
	end
end