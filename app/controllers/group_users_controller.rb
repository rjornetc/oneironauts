class GroupUsersController < ApplicationController
    
    def create  
      @group = Group.find(params[:group_id])
      @member = @group.group_users.build(:user_id => params[:user_id]) 
      @member.manager? = true
      authorize @member 
      if @member.save  
        flash[:notice] = "Added member."  
        redirect_to group_path(@group)
      else  
        flash[:notice] = "Unable to add member."  
        redirect_to group_path(@group)
      end  
    end  
    
    def destroy 
      @group = Group.find(params[:group_id])
      @member = @group.group_users.find_by_user_id(params[:user_id])
      authorize @member  
      @member.destroy  
      flash[:notice] = "Removed member."  
      redirect_to group_path(@group)
    end  
end
