class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  #/explore: my own route!!! This shows ALL POSTS FROM ALL USERS, even without log in
  def explore
    @posts = Post.all
    @activity = Activity.all
  end

end
