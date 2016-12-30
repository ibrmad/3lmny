class Faculty < ApplicationRecord
  has_many :majors
  belongs_to :user
  validates :name, presence: true
end
