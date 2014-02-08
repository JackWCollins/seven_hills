class Group < ActiveRecord::Base
  has_many :reservations
  has_many :students, through: :reservations

  INSTRUCTION_TYPES = ["Tandem", "Instructor Assisted Deployment"]
end