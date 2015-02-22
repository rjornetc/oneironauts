class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    @record.public_profile || (@record == @user) || (@user && @user.role.name == "admin")
  end

  def update?
    @user == @record || (@user && @user.role.name == "admin")
  end

  def edit?
    update?
  end

  def destroy?
    @user == @record || (@user && @user.role.name == "admin")
  end
  
  def cancel?
    @user == @record || (@user && @user.role.name == "admin")
  end

end

