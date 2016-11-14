class Post < ApplicationRecord
  belongs_to :user

  def course
    @course = Course.find(self.course_id)
  end
end
