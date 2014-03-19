class Reservation < ActiveRecord::Base
	include SimpleCalendar
	validates_presence_of :instruction

	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	has_many :groups
	has_many :students, through: :groups

  INSTRUCTION_TYPES = ["Tandem", "Instructor Assisted Deployment"]

  def start_time
  	reservation_time
  end

  def self.search_by_reservation_id(reservation_id)
		return [] if reservation_id.blank?
		Reservation.where("id = ?", reservation_id)
	end
end