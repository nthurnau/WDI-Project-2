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
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to group_path
    end
  end

  def destroy
  end

  def join
    @group = Group.find(params[:id])
    @group.add_user(current_user)
    redirect_to group_path(@group)
  end

  def leave
    @group = Group.find(params[:id])
    @group.remove_user(current_user)
    redirect_to group_path(@group)
  end


private
  def group_params
    params.require(:group).permit(:name, :description, :event_name, :event_location, :event_date, :event_time)
  end

end
