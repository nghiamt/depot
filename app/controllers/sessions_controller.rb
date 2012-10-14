class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url 
    else 
      if params[:name]==nil and params[:password]==nil
        redirect_to login_url, :alert => "Enter your name and password"
      else
        redirect_to login_url, :alert => "Invalid username/password cobination"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged out"
  end
end
