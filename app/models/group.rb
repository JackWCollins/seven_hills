class Group < ActiveRecord::Base
  belongs_to :student
  belongs_to :reservation

  
end