class GroupPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def remove_member?
    @record.users.include?(@user) && @record.group_users.find_by_user_id(@user.id) && @record.group_users.find_by_user_id(@user.id).manager
  end

  def add_member?
    @record.users.include?(@user) && @record.group_users.find_by_user_id(@user.id) && @record.group_users.find_by_user_id(@user.id).manager
  end
  
  def edit?
      @user && @record.group_users.find_by_user_id(@user.id) && @record.group_users.find_by_user_id(@user.id).manager
  end


end

