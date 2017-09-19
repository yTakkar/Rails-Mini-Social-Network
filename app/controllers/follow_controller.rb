class FollowController < ApplicationController

  include ApplicationHelper

  def follow
    Follow.create(:follow_by => session[:id], :follow_to => params[:id])
    redirect_to profile_path(params[:id]), :notice => "Followed #{get(params[:id], 'username')}!!"
  end

  def unfollow
    @f = Follow.where(:follow_by => session[:id], :follow_to => params[:id])
    @f.destroy_all
    redirect_to profile_path(params[:id]), :notice => "Unfollowed #{get(params[:id], 'username')}!!"
  end

  def followers
    loggedIn
    if is_user_valid(params[:id])
      @followers = Follow.where(:follow_to => params[:id]).order(id: :desc)
    else
      invalid_user
    end
  end

  def followings
    loggedIn
    if is_user_valid(params[:id])
      @followings = Follow.where(:follow_by => params[:id]).order(id: :desc)
    else
      invalid_user
    end
  end

end
