class Course < ApplicationRecord
  belongs_to :major
  belongs_to :user
  has_many :documents
  has_many :posts
  validates :name, :major_id, presence: true
  include ImageUploader[:image]

end
