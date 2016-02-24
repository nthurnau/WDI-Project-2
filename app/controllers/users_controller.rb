class UsersController < ApplicationController

  before_action :authorize, only: [:show]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
      @user = User.new(user_params)
      if @user.save
          redirect_to user_path(@user), :notice => "You have succesfully signed up!"
      else
          redirect_to new_user_path
      end
    end

  def edit
    @user = User.find(params[:id])
    @user.build_profile
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user) #not working, don't know why
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
      if @user.destroy
        redirect_to new_session_path
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :avatar, profile_attributes: [:id, :name, :avatar, :location, :breed, :favorite_food, :behavior, :activities])
  end

end
