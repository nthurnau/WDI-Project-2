class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by({email: params[:email]})
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome! Thanks #{@user.email} for Logging In!"
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
      flash[:fail] = "Don't front, try again!"
    end
  end

  def destroy
    session[:user_id] =nil
    redirect_to new_session_path
  end
end
