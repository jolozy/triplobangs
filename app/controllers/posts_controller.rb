class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:explore, :search, :search_result]

  #/posts: shows all posts that have been created on 1 page
  def index
    @posts = current_user.posts
    # @posts = Post.all
    @activity = Activity.all
  end

  #upvote
  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end

  #simple search
  def search
    
  end

  def search_result
    @results = Post.search_country(params[:search])
  end

  #/new: form that will accept user inputs
  def new
    @post = Post.new
    @activity = Activity.new
    # @post.user_id = current_user.id
  end
  #create: clicking of upload button to allow creation of new entry. Redirects to new post
  def create
    @activity = params[:activities] #getting input from isolated form field
    my_params = post_params
    my_params[:user_id] = current_user.id
    if @post = Post.create(my_params) #if object creation is true, go on to create Activity

      @activities = Activity.create(:name => @activity, :post_id => @post.id)
      #when creating new Activity, pass 2 methods @activity and @post values into Activity model

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
    @activity = @post.activities
  end

  #/posts/id/edit
  def edit
    @post = Post.find(params[:id])
    @activity = Activity.find(params[:id])
  end
  #clicking button to update: actually perform an update that touches our database. It’s very similar to our create action but rather than creating, we’re UPDATING
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @activity = Activity.find(params[:id])
    @activity.update(name: params[:activities])
    flash[:success] = "Your post has been updated!"
    redirect_to(post_path(@post))
  end

  #deleting a post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:success] = "Your post has been deleted!"
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:image, :title, :description, :budget, :country)
  end

end
