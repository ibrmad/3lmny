class Course < ApplicationRecord
  belongs_to :major
  has_many :documents
end
