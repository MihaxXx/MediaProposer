## Class with methods to get films from unofficial Kinopoisk API
class KinopoiskApi
  @base_url = 'http://kinopoiskapiunofficial.tech/'
#TODO: Extract one time to class var
  def self.find(name)
    JSON.parse((RestClient.get @base_url + 'api/v2/films?keyword=' + name, {Authorization: ENV['KP_TOKEN']}).body)['films']
  end

  def self.get(id)
    JSON.parse((RestClient.get @base_url + 'api/v2/films/' + id, {Authorization: ENV['KP_TOKEN']}).body)
  end
end