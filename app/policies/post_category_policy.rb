class PostCategoryPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user && @user.role.name == 'admin'
  end

  def update?
    @user && @user.role.name == 'admin'
  end

  def destroy?
    @record.user == @user && @user.role.name == 'admin'
  end


end
