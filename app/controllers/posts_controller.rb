class PostsController < ApplicationController

  def new_post
    loggedIn
    @post = Post.new
  end

  def create_post
    @post = Post.new(post_params)
    if @post.save
      @p = Post.find_by(:id => @post.id)
      @p.update_attributes(:user => session[:id])
      redirect_to view_post_path(@post.id), :notice => "Post Created!!"
    else
      render 'new_post'
    end
  end

  def view_post
    loggedIn
    @post = Post.find_by(:id => params[:id])
    @likes = Like.where(:post => params[:id]).count
  end

  def delete_post
    Like.find_by(:post => params[:id]).destroy
    @post = Post.find_by(:id => params[:id])
    @post.destroy
    redirect_to profile_path(session[:id]), :notice => "Post deleted!!"
  end

  def edit_post
    loggedIn
    @post = Post.find_by(:id => params[:id])
  end

  def update_post
    @post = Post.find_by(:id => params[:id])
    if @post.update_attributes(post_params)
      redirect_to view_post_path(params[:id]), :notice => "Post edited!!"
    else
      render 'edit_post'
    end
  end

  private def post_params
    params.require(:post).permit(:title, :content)
  end

end
