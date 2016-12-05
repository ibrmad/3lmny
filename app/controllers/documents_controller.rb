class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_courses, only: [:edit, :update, :new]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @documents = Document.all
    if params[:search] || params[:course_id]
      @documents = Document.search(params[:search], params[:course_id]).order("created_at DESC")
    else
      @documents = Document.all.order('created_at DESC')
    end
  end

  def show
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user
    @document.course_id = params[:course_id]
    if @document.save
      redirect_to @document
    else
      render :new
    end
  end

  def update
    @document.course_id = params[:course_id]
    if @document.update(document_params)
      redirect_to @document
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end
    def set_courses
      @courses = Course.all.map{|c| [ c.name, c.id ] }
    end
    def document_params
      params.require(:document).permit(:title, :document)
    end
end
