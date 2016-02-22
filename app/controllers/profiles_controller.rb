class ProfilesController < ApplicationController

before_action :authorize, only: [:new]

  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.profiles.new(profile_params)
      if @profile.save
          redirect_to profile_path(@profile)
      end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
      if @profile.update_attributes(profile_params)
        redirect_to profile_path(@profile)
      end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if @profile.destroy
      redirect_to user_path
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :location, :breed, :favorite_food, :behavior, :activities)
  end

end
