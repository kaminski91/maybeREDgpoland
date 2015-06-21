class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :rotator

  def rotator
    @start_gallery = Gallery.find_by(name: "start")
  end
end
