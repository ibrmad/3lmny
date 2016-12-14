class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin
  def index
    @faculties = Faculty.all
  end

  def show
  end

  def new
    @faculty = Faculty.new
  end

  def edit
  end

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
    redirect_to @faculty
    else
    render :new
    end
  end

  def update
    if @faculty.update(faculty_params)
      redirect_to @faculty
    else
      render :edit
    end
  end

  def destroy
    @faculty.destroy
    redirect_to faculties_url
  end

  private
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:name)
    end
end
