class SessionsController < ApplicationController
  before_filter :authenticate_user
  before_filter :save_login_state

  def new

  end


end
