class ApplicationController < ActionController::Base
  before_action :total_short_links

  def redirect_to_original_url
    url = Url.find_by(short: params[:id])
    raise ActionController::RoutingError, 'Not Found' if url.nil?

    redirect_to url.original
  end

  private

  def total_short_links
    @total_links = Url.count
  end
end
