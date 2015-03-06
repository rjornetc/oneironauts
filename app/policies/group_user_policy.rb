class GroupUserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user
  end

  def destroy?
    @user && (@record.group.group_users.find_by_user_id(@user.id).manager || @record.user == @user) || @user.role.name == "admin"
  end


end

