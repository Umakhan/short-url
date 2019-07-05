require 'net/http'

class CheckController < ApplicationController
  def response_code
    uri = URI(params[:url])
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri)
    http.use_ssl = uri.scheme == 'https'
    resp = http.request(req)
    render json: resp.code
  rescue StandardError
    render json: 500
  end
end
