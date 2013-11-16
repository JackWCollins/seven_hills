class Shift < ActiveRecord::Base

	belongs_to :creator, class_name: 'User', foreign_key: :user_id

	validates :role, presence: true
	validates :date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true

	ROLE_TYPES = ["Pilot", "Tandem Instructor", "IAD Instructor", "Coach"]

end