class User < ActiveRecord::Base

  has_many :posts

  has_secure_password validations: false

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password,
    presence: true,
    on: :create,
    length: { minimum: 5 }

end