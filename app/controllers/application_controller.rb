class ApplicationController < ActionController::Base
  before_action :set_current_user

  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
end
