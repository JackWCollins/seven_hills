class Student < ActiveRecord::Base
	has_many :reservations
	has_many :groups, through: :reservations

	validates_presence_of :first_name, :last_name, :email, :phone, :age, :street_address, :city, :state
end