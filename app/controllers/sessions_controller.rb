class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user
      # do something
      log_in(@user)
      redirect_to @user
    else
      # return back to the login page
      render 'new'
    end
  end
end
