module SessionsHelper
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    puts "=================================================Inside logged_in()=========================================================="
    @user.nil?
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      puts "=================================================Inside logged_in_user()=========================================================="
      redirect_to root_path
    end
  end
end
