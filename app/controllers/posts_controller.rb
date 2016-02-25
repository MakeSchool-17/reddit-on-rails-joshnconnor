class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @user = User.find_by_id(session[:user_id]) # how to test this?
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to @post
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
                                   :content)
    end
end
