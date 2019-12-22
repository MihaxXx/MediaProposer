## Class with methods to get films from unofficial Kinopoisk API
class KinopoiskAPI
  @base_url = 'http://kinopoiskapiunofficial.tech/'

  def find(name)
    JSON.parse((RestClient.get @base_url + 'api/v2/films?keyword=' + name, {Authorization: ENV['KP_TOKEN']}).body)['films']
  end

  def get(id)
    JSON.parse((RestClient.get @base_url + 'api/v2/films/' + id, {Authorization: ENV['KP_TOKEN']}).body)
  end
end