class Announcement < ApplicationRecord
  include ImageUploader[:image]
  validates :title, :content, :image, presence: true
end
