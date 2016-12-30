class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_courses, only: [:edit, :update, :new]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search] and not params[:search].empty?
      @documents = Document.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 12)
    else
      @documents = Document.all.order('created_at DESC').paginate(page: params[:page], per_page: 12)
    end
  end

  def show
    redirect_to :documents
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user
    if @document.save
      redirect_to :documents
    else
      render :new
    end
  end

  def update
    if @document.update(document_params)
      redirect_to :documents
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
      params.require(:document).permit(:title, :document, :course_id)
    end
end
