class VoterPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @record.votable.user != @user && !@record.votable.voters.find_by_user_id(@user.id)
  end

  def destroy?
    @record.votable.user != @user && @record.votable.voters.find_by_user_id(@user.id)
  end


end

