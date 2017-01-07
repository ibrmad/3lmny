class Course < ApplicationRecord
  belongs_to :major
  belongs_to :user
  has_many :documents, :dependent => :delete_all
  has_many :posts, :dependent => :delete_all
  validates :name, :major_id, presence: true
  include ImageUploader[:image]

end
