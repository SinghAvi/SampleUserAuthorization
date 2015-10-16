# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  def self.authenticate(username_or_email="", login_password="")
    puts "===============================================Auth=============================================="
    user = User.find_by_email(username_or_email)
    # pp user
    # pp user.password
    # puts login_password
    # if user && user.match_password(login_password)
    if user && (user.password == login_password)
      return user
    else
      return false
    end
  end
  # def match_password(login_password="")
  #   encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  # end
end
