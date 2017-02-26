class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_authorization

  def check_authorization
    if need_authorization?
      redirect_to sign_in_url
    end
  end

  def need_authorization?
    Rails.env == 'production' and not session[:authorized].in? ['user']
  end
end
