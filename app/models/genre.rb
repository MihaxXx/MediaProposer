class Genre < ApplicationRecord
  validates :name, presence: true
  def self.find_or_create(name)
    Genre.find_by_name(name) || Genre.create(name: name)
  end
end