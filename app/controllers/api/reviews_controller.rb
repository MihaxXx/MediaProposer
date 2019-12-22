class Api::ReviewsController < ApplicationController
  def by_user
    render json: Review.find { |r| r.users_id == params['id'] }
  end

  def by_media
    render json: Review.find { |r| r.media_id == params['id'] }
  end
end
