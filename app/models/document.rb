class Document < ApplicationRecord
  include DocumentUploader[:document]
  belongs_to :course
  belongs_to :user

  def course
    @course = Course.find(self.course_id)
  end
end
