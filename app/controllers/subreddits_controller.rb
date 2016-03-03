class SubredditsController < ApplicationController

  def index
    @subreddits = Subreddit.all
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(user_params)
    if @subreddit.save
      redirect_to @subreddit
    else
      render 'new'
    end
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

  private

    def subreddit_params
      params.require(:subreddit).permit(:name,
                                        :title,
                                        :description,
                                        :user_id)
    end

end
