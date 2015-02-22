class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:twitter]
  
  include Gravtastic
  gravtastic
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

         
  belongs_to :role
  
  has_many :meanings
  has_many :dream_signs
  
  has_many :sleep_logs
  
  has_many :logs
  
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
      user.points = 50
      user.bio = ''
      user.public_sleep_log = true
      user.public_profile = true
      user.avatar   = auth.info.image
      user.email    = auth.info.nickname+'@change.me'
      user.password = Devise.friendly_token[0,20]
      user.username = auth.nickname
      user.role     ||= Role.find_by_name('registered')
      #user.image = auth.info.image # assuming the user model has an image
    end
  end
  
  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.twitter_data"]
          user.points = 50
          user.bio = ''
          user.public_sleep_log = true
          user.public_profile = true
          user.avatar   = data['info']['image']
          user.email    = data['info']['nickname']+'@change.me'
          user.password = Devise.friendly_token[0,20]
          user.username = data['info']['nickname']
          user.role     = Role.find_by_name('registered')
        end
      end
    end

end
