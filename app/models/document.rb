class Document < ApplicationRecord
  include DocumentUploader[:document]
  belongs_to :course
  belongs_to :user

  def course
    @course = Course.find(self.course_id)
  end

  def self.search(*params)
    if params[1].present?
      documents = Document.where(course_id: params[1])
      documents = documents.where("title LIKE ?", "%#{params[0]}%") if params[0].present?
    elsif params[0].present?
      documents = Document.where("title LIKE ?", "%#{params[0]}%") if params[0].present?
    end
    documents
  end
end
