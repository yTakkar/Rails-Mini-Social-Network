class LikeController < ApplicationController

  def like
    Like.create(:like_by => session[:id], :post => params[:id])
    redirect_to view_post_path(params[:id]), :notice => "Post Liked!!"
  end

  def unlike
    @ul = Like.where(:like_by => session[:id], :post => params[:id])
    @ul.destroy_all
    redirect_to view_post_path(params[:id]), :notice => "Post Unliked!!"
  end

  def likes
    loggedIn
    @likes = Like.where(:post => params[:id])
  end

end
