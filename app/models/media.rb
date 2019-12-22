class Media < ApplicationRecord
  validates :name, :origin_name, :type, presence: true
  has_many :genres
end