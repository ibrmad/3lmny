class MajorsController < ApplicationController
  before_action :set_major, only: [:show, :edit, :update, :destroy]
  before_action :set_faculty, only: [:edit, :update, :new]

  def index
    @majors = Major.all
  end

  def show
  end

  def new
    @major = Major.new
  end

  def edit
  end

  def create
    @major = Major.new(major_params)
    @major.faculty_id = params[:faculty_id]
    if @major.save
    redirect_to @major
    else
    render :new
    end
  end

  def update
    @major.faculty_id = params[:faculty_id]
    if @major.update(major_params)
      redirect_to @major
    else
      render :edit
    end
  end

  def destroy
    @major.destroy
    redirect_to majors_url
  end

  private

    def set_major
      @major = Major.find(params[:id])
    end

    def set_faculty
      @faculties = Faculty.all.map{|c| [ c.name, c.id ] }
    end

    def major_params
      params.require(:major).permit(:name)
    end
end
