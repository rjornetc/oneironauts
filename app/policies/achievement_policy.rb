class AchievementPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user && @user.role.name == 'admin'
  end

  def create?
    @user && @user.role.name == 'admin'
  end

  def edit?
    @user && @user.role.name == 'admin'
  end

  def update?
    @user && @user.role.name == 'admin'
  end

  def destroy?
    @user && @user.role.name == 'admin'
  end


end
