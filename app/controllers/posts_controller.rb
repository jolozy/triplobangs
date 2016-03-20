class PostsController < ApplicationController

  #/posts: shows all posts that have been created on 1 page
  def index
    @posts = Post.all
  end

  #/new: form that will accept user inputs
  def new
    @post = Post.new
  end
  #create: clicking of upload button to allow creation of new entry. Redirects to new post
  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end



  private
  def post_params
    params.require(:post).permit(:image, :title, :description, :budget)
  end

end
