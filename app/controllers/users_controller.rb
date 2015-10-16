class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:login_attempt]
  before_filter :authenticate_user, :except => [:login_attempt, :create, :show]
  # before_filter :assign_user_id, :only => [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save!
      puts "===============================================create acc=============================================="
      session[:user_id] = @user.id
      pp session[:user_id]
      redirect_to show_path(session[:user_id])
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end

  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def login_attempt
    puts "===============================================Login attempt=============================================="
    pp params[:user][:email]
    # pp params[:email]
    authorized_user = User.authenticate(params[:user][:email], params[:user][:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      puts session[:user_id]
      redirect_to show_path(session[:user_id])
      # redirect_to url_for(:controller => :users, :action => :show)
    else
      puts "===============================================Invalid login=============================================="
      render "users/logout"
    end
  end

  def show
    puts "===============================================Inside show()==============================================="
    @user =  User.find(session[:user_id])
  end

  def logout
    session[:user_id] = nil
    puts "===============================================I am out of application==============================================="
    # render '/logout'
  end

end
