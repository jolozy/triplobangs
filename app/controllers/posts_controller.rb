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
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
    flash.now[:alert] = "Your new post could not be created!"
    render :new
    end
  #insert activity here
  end

  #/posts/id shows individual post
  def show
    @post = Post.find(params[:id])
  end

  #/posts/id/edit
  def edit
    @post = Post.find(params[:id])
  end
  #clicking button to update: actually perform an update that touches our database. It’s very similar to our create action but rather than creating, we’re UPDATING
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:success] = "Your post has been updated!"
    redirect_to(post_path(@post))
  end

  #deleting a post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Your post has been deleted!"
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:image, :title, :description, :budget, :country)
  end

end
