class User < ApplicationRecord
  has_many :docments
  has_many :posts
  has_many :videos
  has_many :faculties
  has_many :majors
  has_many :courses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include ImageUploader[:image]
end
