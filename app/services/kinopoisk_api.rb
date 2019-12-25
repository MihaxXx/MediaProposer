require 'addressable/uri'

## Class with methods to get films from unofficial Kinopoisk API
class KinopoiskApi
  @base_url = 'http://kinopoiskapiunofficial.tech/'
  @token = ENV['KP_TOKEN']

  def self.find(name)
    uri = Addressable::URI.escape((@base_url + 'api/v2/films?keyword=' + name))
    JSON.parse((RestClient.get uri, Authorization: @token).body)['films']
  end

  def self.get(id)
    uri = Addressable::URI.escape((@base_url + 'api/v2/films/' + id))
    JSON.parse((RestClient.get uri, Authorization: @token).body)
  end
end