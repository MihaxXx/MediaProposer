class User < ApplicationRecord
  validates :email, :login, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :media
end