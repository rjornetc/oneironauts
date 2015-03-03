class GroupsController < ApplicationController
  def index
      @groups = Group.all
  end

  def new
     @group = Group.new
  end

  def create
     @group  = Group.new(group_params)
     @creator = @group.group_users.build(:user_id => current_user.id, :manager => true) 
     authorize @creator 
     
     if @group.save
         @creator 
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
  end

  def delete
      @group = Group.find(params[:id])
  end

  def destroy
      @group = Group.find(params[:id])
  end
  
  def show
      @group = Group.find(params[:id])
  end
  
  private
      def group_params
          params.require(:group).permit(:name, :description)
      end
end
