class Video < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :title, :youtube_video_id, :course_id, :status, presence: true
  def self.search(search)
    videos = Video.where("title LIKE ?", "%#{search}%") if search.present?
  end
end
