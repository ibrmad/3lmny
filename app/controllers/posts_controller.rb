class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_courses, only: [:edit, :update, :new]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    # @post.course_id = params[:course_id]
    if @post.save
    redirect_to @post
    else
    render :new
    end
  end

  def update
    # @post.course_id = params[:course_id]
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    def set_courses
      @faculties = Faculty.all.map{|c| [ c.name, c.id ] }
      @majors = Major.all.map{|c| [ c.name, c.id , c.faculty ] }
      @courses = Course.all.map{|c| [ c.name, c.id, c.major ] }
    end
    def post_params
      params.require(:post).permit(:title, :content, :course_id)
    end
end
