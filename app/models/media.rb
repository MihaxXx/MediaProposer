class Media < ApplicationRecord
  validates :name, :origin_name, presence: true
  has_and_belongs_to_many :genres, join_table: :mediagenre

  def self.find_remote(name)
    candidates = []
    local = Media.where('LOWER(origin_name) LIKE LOWER(?)', "%#{name}%")
                 .or(Media.where('LOWER(name) LIKE LOWER(?)', "%#{name}%")).to_a

    if !local || local.length < 3
      (KinopoiskApi.find name).each do |f|
        next if Media.find_by_foreign_id f['filmId']

        t = Media.new
        t.name = f['nameRu']
        t.origin_name = f['nameEn']
        f['genre'].each { |g| t.genres << Genre.find_or_create(g['genre']) }
        t.desc = f['description']
        t.rating = f['rating'].to_d
        # t.type = 'movie' TODO: inherit
        t.release = '1.1.' + f['year']
        t.foreign_id = f['filmId']
        t.poster_url = f['posterUrl']
        candidates << t
        t.save
      end
    else
      candidates |= local
    end

    # TODO: Parse other sources
    candidates
  end
end