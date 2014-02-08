class Student < ActiveRecord::Base
	has_many :reservations
	has_many :groups, through: :reservations
end