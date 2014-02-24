class Shift < ActiveRecord::Base
	include SimpleCalendar

	belongs_to :creator, class_name: 'User', foreign_key: :user_id

	validates :role, presence: true
	validates :date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :person, presence: true

	scope :by_month, lambda { |year, month| where("date >= ? and date <= ?", "#{year}-#{month}-01", "#{year}-#{month}-31") }

	ROLE_TYPES = ["Pilot", "Tandem Instructor", "IAD Instructor", "Coach"]

  def start_time
  	date
  end

end