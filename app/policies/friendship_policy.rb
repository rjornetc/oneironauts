class FriendshipPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @record != @user && !@user.friends.include?(@record)
  end

  def destroy?
    @record != @user
  end


end

