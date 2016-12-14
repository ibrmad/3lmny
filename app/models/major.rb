class Major < ApplicationRecord
  belongs_to :faculty
  belongs_to :user
  has_many :courses
end
