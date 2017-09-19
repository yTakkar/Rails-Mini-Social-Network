class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def loggedIn(path=login_path)
    redirect_to path if !session[:id]
  end

  def loggedOut
    redirect_to root_path if session[:id]
  end

  def is_user_valid(id)
    user = User.find_by(:id => id)
    return user == nil ? false : true
  end

  def invalid_user
    redirect_to root_path, :notice => "User not found!!"
  end

end
