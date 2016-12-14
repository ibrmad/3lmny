class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_courses, only: [:edit, :update, :new]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search] and not params[:search].empty?
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
    @top_courses = Post.top_courses
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
    if @post.save
    redirect_to @post
    else
    render :new
    end
  end

  def update
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

  def upvote
    if not @post.user.id == current_user.id
      @post.upvote_by current_user
      @post.user.save
    end
  end

  def downvote
    if not @post.user.id == current_user.id
      @post.downvote_by current_user
      @post.user.save
    end
  end


  def search
    @posts = Post.search(params)
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
