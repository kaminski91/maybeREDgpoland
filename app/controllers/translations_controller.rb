class TranslationsController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admin
  before_action :set_translation, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /translations
  # GET /translations.json
  def index
    @translations = Translation.all
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  # GET /translations/new
  def new
    @translation = Translation.new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = Translation.new(translation_params)

    respond_to do |format|
      if @translation.save
        format.html { redirect_to @translation, notice: 'Translation was successfully created.' }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1
  # PATCH/PUT /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to @translation, notice: 'Translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy
    respond_to do |format|
      format.html { redirect_to translations_url, notice: 'Translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      params.require(:translation).permit(:startMore_pl, :startMore_en, :startMore_it, :aboutHeader_pl, :aboutHeader_en, :aboutHeader_it, :portfolioHeader_pl, :portfolioHeader_en, :portfolioHeader_it, :portfolioMore_pl, :portfolioMore_en, :portfolioMore_it, :carieerHeader_pl, :carieerHeader_en, :carieerHeader_it, :contactHeader_pl, :contactHeader_en, :contactHeader_it, :contactFollow_pl, :contactFollow_en, :contactFollow_it, :formName_pl, :formName_en, :formName_it, :formEmail_pl, :formEmail_en, :formEmail_it, :formTel_pl, :formTel_en, :formTel_it, :formContent_pl, :formContent_en, :formContent_it, :salonHeader_pl, :salonHeader_en, :salonHeader_it, :portfolioMenu_pl, :portfolioMenu_en, :portfolioMenu_it, :formSend_pl, :formSend_en, :formSend_it, :formPass_pl, :formPass_en, :formPass_it, :formLogin_pl, :formLogin_en, :formLogin_it, :downloadHeader_pl, :downloadHeader_en, :downloadHeader_it, :contactMenu_pl, :contactMenu_en, :contactMenu_it, :newsHeader_pl, :newsHeader_en, :newsHeader_it)
    end
end
