class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def conn
  #   @conn ||= Faraday.new(:url => 'http://localhost:3000') do |faraday|
  #     faraday.request  :url_encoded             # form-encode POST params
  #     faraday.response :logger                  # log requests to STDOUT
  #     faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  #   end
  # end
end
