class Faculty < ApplicationRecord
  has_many :majors
  belongs_to :user
end
