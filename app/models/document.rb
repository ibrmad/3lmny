class Document < ApplicationRecord
  include DocumentUploader[:document]
  belongs_to :course
  belongs_to :user
  validates :title, :document, :course_id, presence: true

  def self.search(search)
    documents = Document.where("title LIKE ?", "%#{search}%") if search.present?
  end
end
