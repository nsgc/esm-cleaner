class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => ENV["BASIC_AUTH_NAME"], :password => ENV["BASIC_AUTH_PASSWORD"]
end
