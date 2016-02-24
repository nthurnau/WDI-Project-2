class MicropostsController < ApplicationController
    before_action :current_user, only: [:create, :destroy]


  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "PetSound created!"
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  def destroy
  end

private

  def micropost_params
      params.require(:micropost).permit(:content)
  end

end
