class GroupUserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @record.user != @user
  end

  def destroy?
    @record.user != @user
  end


end

