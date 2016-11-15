class Course < ApplicationRecord
  belongs_to :major
  has_many :documents
  has_many :posts
end
