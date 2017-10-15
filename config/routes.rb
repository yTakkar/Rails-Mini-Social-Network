Rails.application.routes.draw do

  root 'pages#index'

  # Users controller
  controller :users do
    get 'signup' => :signup
    post 'create_user' => :create_user
    get 'login' => :login
    post 'log_user' => :log_user
    get 'logout' => :logout
    get 'profile/:id' => :profile, as: 'profile'
    get 'deactivate/:id' => :deactivate, as: 'deactivate'
    delete 'delete_account/:id' => :delete_account, as: 'delete_account'
  end

  # Pages
  controller :pages do
    get 'index' => :index
    get 'welcome' => :welcome
    get 'explore' => :explore
  end

  # Posts
  controller :posts do
    get 'new_post' => :new_post
    post 'create_post' => :create_post
    get 'view_post/:id' => :view_post, as: 'view_post'
    delete 'delete_post/:id' => :delete_post, as: 'delete_post'
    get 'edit_post/:id' => :edit_post, as: 'edit_post'
    patch 'update_post/:id' => :update_post, as: 'update_post'
  end

  # Follow
  controller :follow do
    post 'follow/:id' => :follow, as: 'follow'
    post 'unfollow/:id' => :unfollow, as: 'unfollow'
    get 'followers/:id' => :followers, as: 'followers'
    get 'followings/:id' => :followings, as: 'followings'
  end

  # Like system
  controller :like do
    post 'like/:id' => :like, as: 'like'
    post 'unlike/:id' => :unlike, as: 'unlike'
    get 'likes/:id' => :likes, as: 'likes'
  end

end
