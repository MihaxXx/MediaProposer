class Genre < ApplicationRecord
  validates :name, presence: true
  def self.find_or_create(name)
    if name.is_a?(Array)
      genres = Genre.all.to_a
      res = []
      name.each do |n|
        res << (genres.find { |e| e.name == n } || Genre.create(name: n))
      end
      res
    else
      Genre.find_by_name(name) || Genre.create(name: name)
    end
  end
end