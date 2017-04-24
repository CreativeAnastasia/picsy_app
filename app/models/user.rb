class User < ApplicationRecord
  has_many :uploads

  has_secure_password
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
