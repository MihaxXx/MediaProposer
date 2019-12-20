class HomeController < ApplicationController
  def index
    @users = User.all
    @response = RestClient.get 'http://kinopoiskapiunofficial.tech/api/v2/films?keyword=Star', {Authorization: ENV['KP_TOKEN']}
    JSON.parse(@response.body)
  end

end