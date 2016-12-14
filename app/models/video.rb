class Video < ApplicationRecord
  belongs_to :user
  belongs_to :course
  def self.search(search)
    videos = Video.where("title LIKE ?", "%#{search}%") if search.present?
  end
end
