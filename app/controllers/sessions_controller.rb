class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:name] == nil || params[:name].empty?
      redirect_to sessions_new_path
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    if is_logged_in?
      session.delete :name
    end
    redirect_to login_path
  end

  def is_logged_in?
    !!session[:name]
  end
end
