class Post < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def course
    @course = Course.find(self.course_id)
  end
end
