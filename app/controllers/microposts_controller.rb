class MicropostsController < ApplicationController
    before_action :current_user, only: [:create, :destroy]


  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "PetSound created!"
      redirect_to user_path
    else
      redirect_to user_path
    end
  end

  def destroy
  end

private

  def micropost_params
      params.require(:micropost).permit(:content)
  end

end
