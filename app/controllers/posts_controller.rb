class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search] and not params[:search].empty?
      @posts = Post.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 15)
    else
      @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 15)
    end
    @top_courses = Post.top_courses
    @announcement = Announcement.order("date ASC").first
  end

  def show
    @comments = Comment.where(post: @post)
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
    def post_params
      params.require(:post).permit(:title, :content, :course_id)
    end
end
