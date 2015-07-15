class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :rotator
  before_action :load_lang
  helper_method :translation

  $lang = 'pl'

  def rotator
    @start_gallery = Gallery.find_by(name: "start")
  end

  def load_lang
    $lang = cookies[:gpoland_lang] || 'pl'
  end

  def set_lang
    session[:return_to] ||= request.referer || root_url
    $lang = params[:lang]
    cookies[:gpoland_lang] = { :value => params[:lang], :expires => 1.year.from_now }
    redirect_to session.delete(:return_to)
  end

  def translation
    translation = Translation.first
  end
end
