class Api::MediaController < ApplicationController
  def index
    render json: Media.all
  end

  def show
    render json: Media.find { |m| m.id == params['id'] }
  end

  def search
    render json: Media.find { |m| m.name == params['name'] }
  end

  def search_remote
    render json: Media.find_remote(name)
  end
end
