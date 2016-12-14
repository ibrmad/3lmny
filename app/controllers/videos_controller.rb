class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, except: [:index, :show]

  def index
    if params[:search] and not params[:search].empty?
      @videos = Video.search(params[:search]).order("created_at DESC")
    else
      @videos = Video.all.order('created_at DESC')
    end
  end
  def show
    # @realted_videos = Video.where("title like ? AND course_id = ?", "%#{@video.title.partition(" ")[0]}%", @video.course_id)
    @realted_videos = Video.where("title like ? AND course_id = ? AND id != ?", "%#{@video.title.partition(" ").first}%", @video.course_id, @video.id).limit(8)
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :youtube_video_id, :status, :course_id)
    end
end
