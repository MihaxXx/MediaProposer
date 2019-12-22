class Api::ImagesController < ApplicationController
  def show
    render json: Image.find { |i| i.id == params['id'] }
  end
end
