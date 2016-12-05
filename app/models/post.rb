class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :course
  has_many :comments, as: :commentable

  def course
    @course = Course.find(self.course_id)
  end
  def post_votes
    self.get_upvotes.size - self.get_downvotes.size
  end

  def self.search(*params)
    if params[1].present?
      posts = Post.where(course_id: params[1])
      posts = posts.where("title LIKE ?", "%#{params[0]}%") if params[0].present?
    elsif params[0].present?
      posts = Post.where("title LIKE ?", "%#{params[0]}%") if params[0].present?
    end
    posts
  end
end
