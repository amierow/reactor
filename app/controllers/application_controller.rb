class ApplicationController < ActionController::Base
  before_action :authenticate_lead!

  protect_from_forgery with: :exception
end
