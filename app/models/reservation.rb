class Reservation < ActiveRecord::Base
	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	has_many :groups
	has_many :students, through: :groups

  INSTRUCTION_TYPES = ["Tandem", "Instructor Assisted Deployment"]
end