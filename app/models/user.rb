class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include ImageUploader[:image]
  has_many :docments
  has_many :posts

  def posts
    @posts = Post.where(user_id: self).order("created_at DESC")
  end
  def documents
    @docments = Document.where(user_id: self).order("created_at DESC")
  end
end
