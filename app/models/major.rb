class Major < ApplicationRecord
  belongs_to :faculty
  belongs_to :user
  has_many :courses, :dependent => :delete_all
  validates :name, :faculty_id, presence: true
  validates :name, length: {maximum: 50}

end
