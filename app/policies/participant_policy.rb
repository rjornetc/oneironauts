class ParticipantPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user
  end

  def update?
    @user && (@record.user == @user)
  end

  def destroy?
    @user && (@record.user == @user)
  end


end

