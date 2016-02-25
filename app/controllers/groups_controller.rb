class GroupsController < ApplicationController

  before_action :authorize, only: [:edit, :show]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:id])
    @group.users << current_user
    @group = current_user.groups.build(group_params)
      if @group.save
        redirect_to group_path(@group)
      else
        redirect_to new_group_path
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def join
    @group = Group.find(params[:id])
    @group.users << current_user
    redirect_to group_path(@group)
  end

  def leave
    @group = Group.find(params[:id])
    current_user.update_attributes(:group_id nil)
    redirect_to group_path(@group)
  end


private
  def group_params
    params.require(:group).permit(:name, :description)
  end

end
