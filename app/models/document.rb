class Document < ApplicationRecord
  belongs_to :course
  belongs_to :user
  include DocumentUploader[:document]
  def course
    @course = Course.find(self.course_id)
  end
end
