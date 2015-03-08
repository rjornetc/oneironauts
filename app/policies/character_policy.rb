class CharacterPolicy
  attr_reader :user, :record

  def initialize(user, record)
      @user = user
      @record = record
  end

  def show?
      @record.public || @record.user == @user
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
      @user && @record.user == @user
  end

  def destroy?
      @user && @record.user == @user
  end

end

