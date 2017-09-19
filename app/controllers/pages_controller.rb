class PagesController < ApplicationController

  def index
    loggedIn welcome_path
    @id = session[:id]
    @username = session[:username]
  end

  def welcome
    loggedOut
  end

  def explore
    loggedIn
    @explore = User.where.not(:id => session[:id])
  end

end
