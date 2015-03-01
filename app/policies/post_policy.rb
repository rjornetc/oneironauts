class PostPolicy
  attr_reader :user, :record

  def initialize(user, record)
      @user = user
      @record = record
  end

  def show?
      !@record.draft || @user.role.name == "admin"
  end

  def create?
      @user && @user.role.name == "admin"
  end
  
  def new?
      @user && @user.role.name == "admin"
  end
  
  def edit?
      @user && @record.user == @user && @user.role.name == "admin"
  end
  
  def update?
      @user && @record.user == @user && @user.role.name == "admin"
  end

  def delete?
      @user && @record.user == @user && @user.role.name == "admin"
  end

  def destroy?
      @user && @record.user == @user && @user.role.name == "admin"
  end

end

