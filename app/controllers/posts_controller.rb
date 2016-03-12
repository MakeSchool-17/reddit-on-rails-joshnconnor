class PostsController < ApplicationController
  def new
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = Post.new
  end

  def create
    @subreddit = Subreddit.find(params[:subreddit_id])
    @user = User.find_by_id(session[:user_id]) # how to test this?
    @post = @user.posts.create(post_params)
    @post.subreddit_id = params[:subreddit_id]
    if @post.save
      redirect_to subreddit_post_path(@subreddit, @post)
    else
      render 'new'
      # flash
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 2)
  end

  private

    def post_params
      params.require(:post).permit(:title, :link,
                                   :content, :subreddit_id)
    end
end
