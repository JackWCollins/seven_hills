class Opening < ActiveRecord::Base
	belongs_to :student

	validates_presence_of :date, :time, :instruction
end