class User < ApplicationRecord
  has_many :docments, :dependent => :delete_all
  has_many :posts, :dependent => :delete_all
  has_many :videos, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  has_many :Notifications, foreign_key: :recipient_id, :dependent => :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :username, uniqueness: { case_sensitive: false }
  validates :bio, length: { maximum: 255 }
  validates :first_name, :last_name, :username, length: { maximum: 20 }
  validates :email, length: { maximum: 50 }
  validates :username, :format => { :with => /\A[a-zA-Z0-9]*\z/,
    :message => "can only contain letters and numbers" }

  include ImageUploader[:image]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.bio = auth.info.about
      user.username = auth.info.first_name + auth.info.last_name
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end
end
