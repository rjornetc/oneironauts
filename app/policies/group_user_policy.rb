class GroupUserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user #TODO CHECK GROUP PRIVACY
  end

  def destroy?
    @user && @record.group.users.find_by_username(@user.username) && @record.group.users.find_by_username(@user.username).manager
  end


end

