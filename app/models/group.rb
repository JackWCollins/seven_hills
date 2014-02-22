class Group < ActiveRecord::Base
  has_many :reservations
  has_many :students, through: :reservations

  validates_presence_of :size
  INSTRUCTION_TYPES = ["Tandem", "Instructor Assisted Deployment"]
end