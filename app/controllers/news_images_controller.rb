class NewsImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admin
  before_action :set_news_image, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /news_images
  # GET /news_images.json
  def index
    @news_images = NewsImage.all
  end

  # GET /news_images/1
  # GET /news_images/1.json
  def show
  end

  # GET /news_images/new
  def new
    @news_image = NewsImage.new
    if params[:n].present?
      @news = News.find(params[:n])
      @news_image = @news.news_images.new
    else
      redirect_to new_news_path
    end
  end

  # GET /news_images/1/edit
  def edit
  end

  # POST /news_images
  # POST /news_images.json
  def create
    @news_image = NewsImage.new(news_image_params)

    respond_to do |format|
      if @news_image.save
        format.html { redirect_to @news_image.news, notice: 'News image was successfully created.' }
        format.json { render :show, status: :created, location: @news_image }
      else
        format.html { render :new }
        format.json { render json: @news_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_images/1
  # PATCH/PUT /news_images/1.json
  def update
    respond_to do |format|
      if @news_image.update(news_image_params)
        format.html { redirect_to @news_image, notice: 'News image was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_image }
      else
        format.html { render :edit }
        format.json { render json: @news_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_images/1
  # DELETE /news_images/1.json
  def destroy
    @news_image.destroy
    respond_to do |format|
      format.html { redirect_to @news_image.news, notice: 'News image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_image
      @news_image = NewsImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_image_params
      params.require(:news_image).permit(:news_id, :img)
    end
end
