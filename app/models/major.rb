class Major < ApplicationRecord
  belongs_to :faculty
  has_many :courses
end
