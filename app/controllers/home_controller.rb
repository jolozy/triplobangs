class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  #/explore: my own route!!! This shows ALL POSTS FROM ALL USERS, even without log in
  def explore
    @posts = Post.all
    @activity = Activity.all
    @user = User.all
  end

  #/posts/id shows individual post
  def show
    @post = Post.find(params[:id])
    @activity = Activity.find(params[:id]).name
  end

end
