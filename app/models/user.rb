class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:twitter]
         
  belongs_to :role
  before_create :set_default_role
  
  attr_accessor :login
  
  validates :username,
    :presence => true,
    :uniqueness => { :case_sensitive => false }
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image      assuming the user model has an image
    end
  end
  
  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.twitter_data"]
          user.email = data["email"] if user.email.blank?
          user.username = data["username"] if user.username.blank?
        end
      end
    end
  
  private
    def set_default_role
      self.role ||= Role.find_by_name('registered')
    end
end
