class HomeController < ApplicationController
  def index
    @users = User.all
    @response = RestClient.get 'http://kinopoiskapiunofficial.tech/api/v2/films?keyword=Star', {Authorization: ENV['KP_TOKEN']}
    @res = JSON.parse(@response.body)['films'][0]
  end

end