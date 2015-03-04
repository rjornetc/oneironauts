class BoardMessagePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    @record.group.public || (@user && @record.group.users.include?(@user))
  end

  def new?
    @user && @record.group.users.include?(@user)
  end

  def create?
    @user && @record.group.users.include?(@user)
  end

  def delete?
    false
  end

  def destroy?
    false
  end
  
  def edit?
      @user && @record.group.users.include?(@user) && @record.user == @user
  end
  
  def update?
      @user && @record.group.users.include?(@user) && @record.user == @user
  end


end

