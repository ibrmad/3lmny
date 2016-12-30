class SearchesController < ApplicationController
  def index
    if params[:search].present?
      @posts = Post.where("title like ?", "%#{params[:search]}%")
      @documents = Document.where("title like ?", "%#{params[:search]}%")
      @videos = Video.where("title like ?", "%#{params[:search]}%")
    end
  end
end
