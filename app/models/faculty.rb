class Faculty < ApplicationRecord
  has_many :majors, :dependent => :delete_all
  belongs_to :user
  validates :name, presence: true
  validates :name, length: {maximum: 100}
end
