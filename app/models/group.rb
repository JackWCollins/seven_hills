class Group < ActiveRecord::Base
  has_many :reservations
  has_many :students, through: :reservations
end