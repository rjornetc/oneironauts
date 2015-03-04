class MeaningPolicy
  attr_reader :user, :record

  def initialize(user, record)
      @user = user
      @record = record
  end

  def create?
      @user
  end

  def destroy?
      @record.user == @user
  end
  
  def edit?
      @record.user == @user
  end
  
  def update?
      @record.user == @user
  end
  
  def delete?
      @record.user == @user
  end
  
  def new?
      @user
  end


end

