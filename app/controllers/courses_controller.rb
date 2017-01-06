class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin, except: [:index, :show]

  def index
    if params[:major_id] and not params[:major_id].empty?
      @courses = Course.where(major_id: params[:major_id]).order(:name)
      @major = Major.find(params[:major_id])
    else
      @courses = Course.where(major_id: 1).order(:name)
      @major = Major.find(1)
    end
  end

  def show
    @posts = Post.where(course_id: @course.id).paginate(page: params[:page], per_page: 10)
    @documents = Document.where(course_id: @course.id).paginate(page: params[:page], per_page: 10)
    @videos = Video.where(course_id: @course.id).paginate(page: params[:page], per_page: 10)
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    if @course.save
    redirect_to @course, notice: 'Course was successfully created.'
    else
    render :new, alert: 'Something went wrong!'
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, success: 'Course was successfully updated.'
    else
      render :edit, alert: 'Something went wrong!'
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :major_id, :image)
    end
end
