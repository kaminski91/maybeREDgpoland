class PagesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :only_admin, except: :index
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @static = Page.first
    @portfolio = Portfolio.all.order(:np)
    @madeing = MadeInG.all.order(:id)
    @showroom = Showroom.all.order(:id)
    @news = News.where(active: true).order(date: :desc)
    @start_gallery = Gallery.find_by(name: "start")
    @madeing_gallery = Gallery.find_by(name: "makeing")
    @showroom_gallery = Gallery.find_by(name: "showroom")
  end

  # GET /pages/1/edit
  def edit
    render layout: 'admin'
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    if @page.update(page_params)
      redirect_to edit_page_path(1), flash: {success: 'Zmiany zostały zapisane'}
    else
      render :edit
    end
  end

  def admin
    render 'shared/admin', layout: 'admin'
  end

  # # GET /pages/1
  # # GET /pages/1.json
  # def show
  # end

  # # GET /pages/new
  # def new
  #   @page = Page.new
  # end

  # # POST /pages
  # # POST /pages.json
  # def create
  #   @page = Page.new(page_params)

  #   respond_to do |format|
  #     if @page.save
  #       format.html { redirect_to @page, notice: 'Page was successfully created.' }
  #       format.json { render :show, status: :created, location: @page }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @page.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /pages/1
  # # DELETE /pages/1.json
  # def destroy
  #   @page.destroy
  #   respond_to do |format|
  #     format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:startText_pl, :aboutText_pl, :retailAcademyText_pl, :carieerText_pl, :contactText_pl, :startText_en, :startText_it, :aboutText_en, :aboutText_it, :retailAcademyText_en, :retailAcademyText_it, :carieerText_en, :carieerText_it, :contactText_en, :contactText_it, :retail_img)
    end
end
