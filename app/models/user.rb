class User < ApplicationRecord
  has_many :docments, :dependent => :delete_all
  has_many :posts, :dependent => :delete_all
  has_many :videos, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  has_many :Notifications, foreign_key: :recipient_id, :dependent => :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :username, uniqueness: { case_sensitive: false }
  include ImageUploader[:image]
end
