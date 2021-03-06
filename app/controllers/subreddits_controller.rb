class SubredditsController < ApplicationController

  def index
    @subreddits = Subreddit.all
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    @subreddit.user_id = session[:user_id]
    if @subreddit.save
      redirect_to @subreddit
    else
      flash[:danger] = "invalid subreddit submission/save: #{@subreddit.errors.inspect}"
      render :new
    end
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

  def edit
    @subreddit = Subreddit.find_by_id(params[:id])
    # should redirect back to @subreddit
  end

  def update
    @subreddit = Subreddit.find_by_id(params[:id])
    if @subreddit.update_attributes(subreddit_params)
      redirect_to @subreddit
    else
      flash[:danger] = "Unable to update subreddit"
      render :edit
    end
  end

  def destroy
    # We know this controller is weird but we'll fix it
    # once devise comes into play... bare with us
    if @subreddit = Subreddit.find_by_id(params[:id])
      unless @subreddit.name == "frolfy"
        @subreddit.destroy
        flash[:success] = "#{@subreddit.name} deleted succesfully"
        redirect_to r_all_path
      else
        render 'show'
        flash[:danger] = "no subreddit found with id"
      end
    end
    # else
    #   render 'show'
    #   flash[:danger] = "no subreddit found with id"
    # end
  end

  private

    def subreddit_params
      params.require(:subreddit).permit(:name,
                                        :title,
                                        :description,
                                        :user_id)
    end

end
