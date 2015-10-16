class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  layout :layout_selection

  def layout_selection
    if session[:user_id]
      'auth_users'
    else
      'application'
    end
  end

  # def assign_user_id
  #   puts "===============================================Assign_user_id=============================================="
  #   session[:user_id] = params[:user][:id]
  #   pp session[:user_id]
  # end

  def authenticate_user
    if session[:user_id]
      # set current user object to @current_user object variable
      puts "===============================================auth_if=============================================="
      @current_user = User.find session[:user_id]
      return true
    else
      puts "===============================================auth_else=============================================="
      redirect_to(:controller => 'welcome', :action => 'index')
      return false
    end
  end

  def save_login_state
    if session[:user_id]
      puts "===============================================Already logged in=============================================="
      redirect_to show_path(session[:user_id])
      return false
    else
      return true
    end
  end
end
