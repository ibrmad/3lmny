class Post < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :comments, as: :commentable

  def course
    @course = Course.find(self.course_id)
  end
end
