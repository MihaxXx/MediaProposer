class Media < ApplicationRecord
  validates :name, :origin_name, :type, presence: true
  has_many :genres

  def find_remote(name)
    candidates = []
    (KinopoiskAPI.find name).each do |f|
      t = Media.new
      t.name = f['nameRu']
      t.origin_name=f['nameEn']
      f['genre'].each {|g| t.genres << g['genre']}
      t.desc = f['description']
      t.rating = f['rating']
      t.type = 'movie'
      t.release = '1.1.' + f['year']
      t.foreign_id = f['filmId']
      candidates << t
      # i = Image.new
      # i.URL = f['posterUrl']
      # Image << i
      # t.image_id =
    end
    # TODO: Parse other sources
    candidates.each { |c| Media << c }
    candidates
  end
end