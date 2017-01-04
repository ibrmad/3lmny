class Document < ApplicationRecord
  include DocumentUploader[:document]
  belongs_to :course
  belongs_to :user
  validates :title, :document, :course_id, presence: true
  scope :approved_document, -> { where(approved: true) }

  def self.search(search)
    documents = Document.approved_document.where("title LIKE ?", "%#{search}%") if search.present?
  end
end
