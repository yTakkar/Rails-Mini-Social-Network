module ApplicationHelper

  def get(id, what)
    @find = User.find_by(:id => id)
    return @find[what]
  end

  def is_following(id)
    f = Follow.where(:follow_by => session[:id], :follow_to => id)
    return f.count == 0 ? false : true
  end

  def no_of_followers(user)
    f = Follow.where(:follow_to => user)
    return f.count
  end

  def username_decider(id)
    @username = get(id, "username")
    if @username == session[:username]
      return "You"
    else
      return @username
    end
  end

  def liked(post)
    like = Like.where(:like_by => session[:id], :post => post)
    return like.count == 0 ? false : true
  end

end
