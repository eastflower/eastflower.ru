class ApplicationController < ActionController::Base
  include ::ControllerRestrictions
  include ::UserRoom::ApplicationController

  include ::TheCommentsBase::ViewToken
  def comments_cookies_token; 'TheComments3Cookies'; end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
