class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.find_by(name: params[:user][:name])
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to 'users/home'
    else
      redirect_to '/login'
    end
  end
end
