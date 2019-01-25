class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  include Turbolinks::Redirection
end
