class ProfilesController < ApplicationController
# before_action :authenticate, only: [:show]
before_action :authorize, only: [:edit, :show]

  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(params[:id])
    @microposts = @profile.user.microposts
    @feed_items = @profile.user.feed.paginate(page: params[:page])

  end

  def new
    @profile = Profile.new(profile_params)
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
        redirect_to profile_path
    else
        redirect_to new_profile_path
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
      if @profile.update_attributes(profile_params)
        redirect_to profile_path
      end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if @profile.destroy
      redirect_to user_path(@user)
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :location, :breed, :favorite_food, :behavior, :activities, :avatar)
  end

end
