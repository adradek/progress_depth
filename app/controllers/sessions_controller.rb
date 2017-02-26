class SessionsController < ApplicationController
  skip_before_action :check_authorization

  def new
  end

  def create
    if params[:username] == ENV['CREDENTIALS_USERNAME'] && params[:password] == ENV['CREDENTIALS_PASSWORD']
      session[:authorized] = 'user'
      redirect_to root_url
    else
      session.delete(:authorized)
      redirect_to sign_in_url
    end
  end
end
