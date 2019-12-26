class HomeController < ApplicationController
  def index
    if params[:search].present?
      @res = Media.find_remote(params[:search])
    else
      @res = Media.where('(release IS NOT NULL) AND (rating > 0) AND (rating < 10)').sample(5)
    end
  end
end