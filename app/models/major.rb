class Major < ApplicationRecord
  belongs_to :faculty
  belongs_to :user
  has_many :courses
  validates :name, :faculty_id, presence: true

end
