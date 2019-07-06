class UrlsController < ApplicationController
  def index
    @url = Url.new
  end

  def generate_short_url
    short_url = [*('a'..'z'), *('0'..'9')].sample(rand(7..20)).join
    render json: { url: short_url }
  end
end
