class HomeController < ApplicationController
  def index
    if params[:search].present?
      @res = Media.find_remote(params[:search])
    else
      @res = Media.first(5)
    end
  end
end