class Media < ApplicationRecord
  validates :name, :origin_name, presence: true
  has_and_belongs_to_many :genres, join_table: :mediagenre

  def self.convert_kp_to_media(film)
    Media.new(
      name: film['nameRu'],
      origin_name: film['nameEn'],
      genres: Genre.find_or_create(film['genre'].map { |g| g['genre'] }),
      # film['genre'].each { |g| t.genres << Genre.find_or_create(g['genre']) }
      desc: film['description'],
      rating: film['rating'].to_d,
      # type: 'movie', TODO: inherit
      release: '1.1.' + film['year'],
      foreign_id: film['filmId'],
      poster_url: film['posterUrl']
    )
  end

  def self.find_remote(name)
    candidates = Media.where('LOWER(origin_name) LIKE LOWER(?)', "%#{name}%")
                      .or(Media.where('LOWER(name) LIKE LOWER(?)', "%#{name}%")).to_a

    if !candidates || candidates.length < 3
      (KinopoiskApi.find name).each do |f|
        next if Media.find_by_foreign_id f['filmId']

        candidates << (t = convert_kp_to_media(f))
        t.save
      end
    end

    # TODO: Parse other sources
    candidates
  end
end