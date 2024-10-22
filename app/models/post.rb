class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :course
  has_many :comments, as: :commentable, :dependent => :delete_all
  has_many :users, through: :comments
  validates :title, :content, :course_id, presence: true
  def post_votes
    self.get_upvotes.size - self.get_downvotes.size
  end
  def self.search(search)
    posts = Post.where("title LIKE ?", "%#{search}%") if search.present?
  end
  def self.top_courses
    sorted_courses = Hash.new
    @courses = Course.all.each do |course|
      sorted_courses[course] = course.posts.count
    end
    sorted_courses.sort_by {|_key, value| value}.take(10).reverse
  end
end
