class User < ApplicationRecord
  has_many :docments
  has_many :posts
  has_many :videos
  has_many :faculties
  has_many :majors
  has_many :courses
  has_many :comments
  has_many :Notifications, foreign_key: :recipient_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: { case_sensitive: false }
  include ImageUploader[:image]
end
