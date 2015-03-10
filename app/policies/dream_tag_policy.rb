class DreamTagPolicy
  attr_reader :user, :record

  def initialize(user, record)
      @user = user
      @record = record
  end

  def show?
      true
  end

  def create?
      @user
  end

  def new?
      @user
  end

  def edit?
      @user && @record.user == @user
  end

  def update?
      @user && @record.user == @user
  end

  def delete?
      @user && (@user.role.name == "admin" || @record.user == @user)
  end

  def destroy?
      @user && (@user.role.name == "admin" || @record.user == @user)
  end

end
